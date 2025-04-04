#!/usr/local/bin/pwsh
#requires -Module AWS.Tools.TrustedAdvisor  

param (
  [string]$Name
)

$RecommendationList = Get-TARecommendationList | Where-Object { $_.Name -like "*$Name*" }
# Example: 
#$RecommendationList         = Get-TARecommendationList | ? { $_.Name -like "*public IPv4*"}  

# Check the length of the recommendation list
Write-Output "Length of Recommendation List: $($RecommendationList.Count)"

# Print the recommendations list
Write-Output "Recommendations: $($RecommendationList)"

$RecommendationResourceList = @()
foreach ($Recommendation in $RecommendationList) {
  #$RecommendationResourceList += Get-TARecommendationResourceList -RecommendationIdentifier $Recommendation.Arn | Where-Object { $_.Status -eq "Error" }
  $RecommendationResourceList += Get-TARecommendationResourceList -RecommendationIdentifier $Recommendation.Arn | 
    Where-Object { $_.Status -eq "Error" -or $_.Status -eq "Warning" }
  Write-Output "Recommendation: $($Recommendation.Name)"
  Write-Output "Recommendation list objects: $($RecommendationResourceList.Count)"
}

#$RecommendationResourceList = Get-TARecommendationResourceList -RecommendationIdentifier $RecommendationList.Arn | Where-Object { $_.Status -eq "Error" }  
Write-Output "Recommendation Resource List: $($RecommendationResourceList.Count)"

# Exit if there are no recommendations
if ($RecommendationResourceList.Count -eq 0 -or $RecommendationResourceList.Count -eq $null) {
  Write-Output "No recommendations found to exclude."
  exit
}

# Recommendation to be excluded
Write-Output "Recommendations to be excluded:"
Write-Output ""
$RecommendationResourceList | ForEach-Object {  
  Write-Output $_
}

# Ask user if they are sure before proceeding
Write-Host "Are you sure you want to exclude the following recommendations? (Y/N)"
$response = Read-Host

if ($response -ne 'Y' -and $response -ne 'y') {
  Write-Output "Operation cancelled."
  exit
}

$RecommendationResourceList | ForEach-Object {  
  $Exclude = New-Object Amazon.TrustedAdvisor.Model.RecommendationResourceExclusion -Property @{Arn=$_.Arn;isExcluded=$True}  
  Update-TAUpdateRecommendationResourceExclusionBatch -RecommendationResourceExclusion $Exclude  
  Write-Output "Excluded: $($_.Arn)"
  Write-Output $_
}

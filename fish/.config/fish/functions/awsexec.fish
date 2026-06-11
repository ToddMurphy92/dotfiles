function awsexec --description 'Execute any command in an aws-vault profile via server mode (creds auto-refresh)'
    # Usage: awsexec <profile> <command> [args...]
    # Examples:
    #   awsexec bedrock.prd-coreops claude
    #   awsexec bedrock.prd-coreops cdk deploy
    #   awsexec bedrock.prd-coreops terraform apply

    if test (count $argv) -lt 2
        echo "usage: awsexec <profile> <command> [args...]" >&2
        echo "" >&2
        echo "Available profiles:" >&2
        aws-vault list --profiles >&2
        return 1
    end

    set -l profile $argv[1]
    set -l command $argv[2]
    set -l rest $argv[3..-1]

    # --server mode: background ECS credential server, creds auto-refresh
    # AWS_SHARED_CREDENTIALS_FILE=/dev/null forces SDK to use container creds
    # instead of static keys in ~/.aws/credentials
    env AWS_SHARED_CREDENTIALS_FILE=/dev/null aws-vault exec --server $profile -- $command $rest
end

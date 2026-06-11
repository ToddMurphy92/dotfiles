# Complete the first argument with aws-vault profile names.
complete -c awsfish -n '__fish_is_first_token' -f -a '(aws-vault list --profiles 2>/dev/null)'

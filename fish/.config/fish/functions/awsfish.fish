function awsfish --description 'Launch a fish shell in any aws-vault profile via server mode (creds auto-refresh, no expiry mid-session)'
    if test (count $argv) -eq 0
        echo "usage: awsfish <profile> [fish args...]" >&2
        echo "profiles:" >&2
        aws-vault list --profiles >&2
        return 1
    end

    set -l profile $argv[1]
    set -l rest $argv[2..-1]

    # --server runs a background ECS credential server instead of baking
    # expiring env vars into the process. The AWS SDK fetches fresh creds per
    # call and aws-vault re-assumes the role before each expiry, so the shell
    # stays usable for the life of the underlying source session (~8h) rather
    # than dying when the 1h role creds lapse.
    #
    # AWS_SHARED_CREDENTIALS_FILE=/dev/null is critical: the SDK credential
    # chain consults the shared-credentials [default] profile BEFORE the ECS
    # container endpoint. With --server injecting no env keys, the static
    # IAM-user key in ~/.aws/credentials [default] would otherwise shadow the
    # role creds aws-vault serves — landing you on the bare user identity
    # instead of the assumed role. Blanking the file lets the chain fall
    # through to the container creds. aws-vault reads its master creds from the
    # keychain, not this file, so nothing else is affected.
    env AWS_SHARED_CREDENTIALS_FILE=/dev/null AWS_FISH_PROFILE=$profile \
        aws-vault exec --server $profile -- fish $rest
end

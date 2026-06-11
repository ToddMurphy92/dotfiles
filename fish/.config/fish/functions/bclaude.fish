function bclaude --description 'Claude Code on Bedrock via OIDC (Okta auth with monitoring, quotas, and user simulation)'
    # Uses the ClaudeCode AWS profile configured for OIDC authentication.
    # This authenticates via Okta and assumes the SRG-App-BedrockOkta-Role,
    # which provides:
    # - Bedrock access in ap-southeast-2 and ap-southeast-4
    # - CloudWatch/OTEL monitoring
    # - Quota enforcement (180M monthly, 6.6M daily tokens)
    # - User-level permissions (not admin Core-Ops)
    #
    # AWS_SHARED_CREDENTIALS_FILE=/dev/null forces the AWS SDK to skip
    # static keys in ~/.aws/credentials and use the credential_process.
    # Without this, the [default] IAM user key would shadow the OIDC creds.
    #
    # For admin/debugging with SRG-Core-Ops role instead, use:
    #   awsexec bedrock.prd-coreops claude
    env AWS_PROFILE=ClaudeCode AWS_SHARED_CREDENTIALS_FILE=/dev/null claude $argv
end

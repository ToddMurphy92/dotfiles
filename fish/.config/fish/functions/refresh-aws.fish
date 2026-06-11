function refresh-aws --description 'Re-prompt MFA and refresh the aws-vault `work` source session (run from a SEPARATE terminal while Claude keeps running)'
    # The `work` session (sts.GetSessionToken, ~8h) is the source for every
    # role profile. When it lapses, every assume-role fails. Running this
    # re-prompts for MFA and writes a fresh `work` session into the keychain.
    #
    # IMPORTANT: run this in a DIFFERENT terminal, not inside the one running
    # `bclaude`. A bclaude/--server session picks up the renewed source
    # session automatically on its next background refresh — no restart needed.
    aws-vault exec work -- true
    and echo "✓ aws-vault 'work' session refreshed. Running bclaude sessions will pick it up automatically."
end

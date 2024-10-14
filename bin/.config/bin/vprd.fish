#!/opt/homebrew/bin/fish
set -Ux VAULT_ADDR https://vault.aws.superretailgroup.com/
set -Ux VAULT_SSH_PATH ssh-key-signer
set -Ux VAULT_SSH_PUBLIC_KEY ~/.ssh/id_ed25519.pub
set -Ux VAULT_SSH_ROLE wildcard_modern_role
echo "Finished setting up Vault PRD environment variables"

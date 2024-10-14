if status is-interactive
    # Commands to run in interactive sessions can go here
    # Enable atuin
    atuin init fish | source
    # oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json | source
    oh-my-posh init fish --config ~/dotfiles/ohmyposh/catppuccin_mocha_devops.omp.json | source
    # If $VAULT_ADDR = https://vault.aws.superretailgroup.com/ then set VAULT_ENV = PRD
    if test $VAULT_ADDR = "https://vault.aws.superretailgroup.com/"
        set -Ux VAULT_ENV " PRD"
    else if test $VAULT_ADDR
        set -Ux VAULT_ENV " OTHER"
    else
        set -e VAULT_ENV
    end
end

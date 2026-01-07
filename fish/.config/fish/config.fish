fish_add_path /opt/homebrew/bin/
fish_add_path ~/.local/bin/
if status is-interactive
    set --global fish_key_bindings fish_vi_key_bindings
    # Commands to run in interactive sessions can go here
    # Enable atuin
    atuin init fish | source
    # oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json | source
    oh-my-posh init fish --config ~/dotfiles/ohmyposh/catppuccin_mocha_devops.omp.json | source
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Enable atuin
    atuin init fish | source
    # oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json | source
end

autoload colors
colors
###############################################
# Lines configured by zsh-newuser-install

# History file and history size
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vi mode
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/todd/.zshrc'

# Initialize zsh completion system
autoload -Uz compinit
compinit
# End of lines added by compinstall
###############################################
# Plugin example
# source ~/.configs/zsh/plugins/pluginfilename

# Sources
# Alias List
source ~/.config/zsh/zsh-aliases
# Exports
source ~/.config/zsh/zsh-exports
# Prompt
source ~/.config/zsh/zsh-prompt
# Vim style cursor
source ~/.config/zsh/zsh-cursor
# McFly - Replaces ctrl-r history search
source ~/.config/zsh/zsh-mcfly
# Vault
source ~/.config/zsh/zsh-vault

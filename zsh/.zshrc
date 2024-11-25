source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
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
# autoload -Uz compinit
# compinit
# End of lines added by compinstall
###############################################
# Plugin example
# source ~/.configs/zsh/plugins/pluginfilename

# Sources
# # zsh-autocomplete - is supposed to be loaded before calls to compdef
#source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
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
# # zsh-autosuggestions
# source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# # zsh-autosuggestions custom config
# source ~/.config/zsh/zsh-autosuggestions
# zsh-syntax-highlighting
# source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f /opt/homebrew/bin/kubectl ]; then
  source <(kubectl completion zsh)
fi


. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. "/Users/todd/.deno/env"
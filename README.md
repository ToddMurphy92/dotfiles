My dotfiles repo.
Managed with stow.
Currently just for my Macbook but should also work on Linux.
Still new to stow but liking it so far, if I decide to stick to it and move my Linux server to this method of dotfile management then I'll flesh this README out a bit more.

# Install stow with homebrew
`brew install stow`

# Stow usage
Stow all folders:
`stow */` (the / is important so it doesn't also get files in the top level of this repo, like the README.md)

Stow just one specific folder:
`stow <folder>` e.g. `stow kitty`

Stow symlinks the files in the folders below to their respective locations within the home directory. Note that stow should always be ran from ./dotfiles, typically located at ~/dotfiles.

For example running when running `stow zsh`:
`~/.zshrc` is symlinked to `~/dotfiles/zsh/.zshrc`
`~/.config/zsh-aliases` is symlinked to `~/dotfiles/zsh/.config/zsh-aliases`
And so on for the other three `.config` files.

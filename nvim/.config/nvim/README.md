Config initially built from the kickstart.nvim config then inspiration also taken from the Primagen's video on
building a neovim configuration from scratch. Right now this configuration is a weird amalgamation of both
TJ's kickstart, Primes personal config structure and my own preferences added on top.

# File structure
- lua/
    - custom/
        - plugins/
        - lazy.lua
    - todd/
        - init.lua
        - lsp.lua
        - remap.lua
        - set.lua
        - telescope.lua
        - theme.lua
        - treesitter.lua
- init.lua

## lua
### custom
lazy.lua: Lazy.nvim plugin manager. Also used to load plugins that don't require custom config, and themes.
#### plugins
For plugins that require configuration.
Some of the files in the todd/ folder could probably do with being moved here
when I can be bothered. e.g. treesitter.lua, telescope.lua, lsp.lua
We already have .lua files for those plugins in that folder though. 
To move the config in there requires re-writing how the options are set and I can't be bothered with that rn.
##### theme.lua
For whatever theme I am in the mood for currently. Usually set to match my terminal.
### todd
For my own custom configurations
init.lua: Loads everything in the order of my choosing
lsp.lua: LSP setup
remap.lua: key mappings
set.lua: nvim settings
telescope.lua: Telescope settings
theme.lua: Theme settings
treesitter.lua: Treesitter settings

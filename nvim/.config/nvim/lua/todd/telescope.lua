-- [[ Configure Telescope ]]
local set = vim.keymap.set
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Enable telescope file browser, if installed
pcall(require('telescope').load_extension 'file_browser')

-- See `:help telescope.builtin`
set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- File browser mappings
-- File browser mapping inspo:
-- https://github.com/fdschmidt93/dotfiles/blob/c4c2dc208e84164e50bece2d033e62468a20eb6f/nvim/.config/nvim/lua/fds/mappings.lua
set("n", "<leader>fb", function()
  require("telescope").extensions.file_browser.file_browser()
end, { silent = true, desc = '[F]ile [B]rowser' })

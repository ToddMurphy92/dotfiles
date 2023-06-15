-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Map <leader>pv to go back to the file browser in your current location
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move highlighted text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Toggle colorcolumn with <leader>tc
function ToggleColorColumn()
  local colorcolumn = vim.wo.colorcolumn or ""
  if colorcolumn ~= "" then
    vim.wo.colorcolumn = ""
  else
    vim.wo.colorcolumn = "81" -- Change this to your desired column number
  end
end

vim.keymap.set('n', '<leader>tc', ':lua ToggleColorColumn()<CR>', { noremap = true, desc = "Toggle colorcolumn" })

-- Unmap Q -- Uncommented as neovim has changed the default behaviour it seems
-- vim.keymap.set("n", "Q", "<nop>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

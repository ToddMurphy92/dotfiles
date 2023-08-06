return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = "[H]arpoon - [A]dd file" })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = "[H]arpoon - [T]oggle quick menu" })

    vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end, { desc = "[H]arpoon - First file" })
    vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end, { desc = "[H]arpoon - Second file" })
    --vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end) -- This one is used by nvim-cmp
    vim.keymap.set('n', '<C-s>', function() ui.nav_file(3) end, { desc = "[H]arpoon - Third file" })
  end
}

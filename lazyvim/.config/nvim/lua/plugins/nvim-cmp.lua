-- Set nvim-cmp keybindings
-- So that <Right> selects the current completion item
return {
  print("Loading nvim-cmp keybindings plugin"),
  "hrsh7th/nvim-cmp",
  enabled = false,
  print("Set nvim-cmp to disabled"),
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = cmp.mapping({
      print("Testing nvim-cmp keybindings"),
      ["<Right>"] = cmp.mapping.confirm({ select = true }), -- Enter confirms completion
      ["<Esc>"] = cmp.mapping.abort(), -- Escape aborts completion
      ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab selects next item
      ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift-Tab selects previous item
      ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Ctrl-u scrolls docs up
      ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Ctrl-d scrolls docs down
    })
  end,
}

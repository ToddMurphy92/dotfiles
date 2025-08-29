return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      yaml = true,
      help = true,
    },
  },
}

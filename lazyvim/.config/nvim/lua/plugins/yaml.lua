return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              customTags = {
                "!Ref scalar",
                "!Sub scalar",
                "!GetAtt scalar",
                "!FindInMap sequence",
                "!Base64 scalar",
                "!Join sequence",
                "!Select sequence",
                "!Split sequence",
                "!ImportValue scalar",
                "!Condition scalar",
                "!If sequence",
                "!Equals sequence",
                "!And sequence",
                "!Or sequence",
                "!Not sequence",
              },
            },
          },
        },
      },
    },
  },
}

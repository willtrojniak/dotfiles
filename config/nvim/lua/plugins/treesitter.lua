return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({

      -- Install parsers asynchronously
      sync_install = false,

      -- Ensure that the following parsers are always installed
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx"
      },




      ignore_install = {},

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      modules = {},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}


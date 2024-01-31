return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}


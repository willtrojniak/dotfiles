return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
  end,
  opts = {
    window = {
      margin = {0, 0, 0, 0},
      padding = {1, 1, 1, 1},
      border = "none",
      winblend = 10
    },
    plugins = {
      presets = {
        operators = false,
        motions = false,
        nav = false,
      },
    },
    operators = {
      gc = "Comments"
    },
    show_help = false,
    -- Custom table for setup
    defaults = {
      mode = {"n", "v"},
      ["g"] = {name = "+goto"},
      ["s"] = {name = "+surround"},
      ["z"] = {name = "+fold"},
      ["]"] = {name = "+next"},
      ["["] = {name = "+prev"},
      ["<leader>f"] = {name = "files"}

    }
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end
}

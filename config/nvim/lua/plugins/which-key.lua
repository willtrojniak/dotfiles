return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
  end,
  opts = {
    win = {
      padding = { 1, 1, 1, 1 },
      border = "none",
      height = { min = 2, max = 6 },
      wo = {
        winblend = 10
      }
    },
    plugins = {
      presets = {
        operators = false,
        motions = false,
        nav = false,
      },
    },
    show_help = false,
    -- Custom table for setup
    defaults = {
      mode = { "n", "v" },
      { "g",         group = "goto" },
      { "s",         group = "surround" },
      { "z",         group = "fold" },
      { "]",         group = "next" },
      { "[",         group = "prev" },
      { "<leader>f", group = "files" },
      { "<leader>i", group = "inspect" },
      { "<leader>s", group = "surroundings" },
    }
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.defaults)
  end
}

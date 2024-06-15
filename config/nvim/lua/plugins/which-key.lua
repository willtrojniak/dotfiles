return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
  end,
  opts = {
    window = {
      margin = {0, 0, 0, 0},
      border = "none",
      winblend = 10
    }
  }
}

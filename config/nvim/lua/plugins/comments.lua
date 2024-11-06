return {
  {
    'echasnovski/mini.comment',
    version = '*',
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope theme=ivy<cr>", "Comments" }
    },
    opts = function()
      local palette = require("catppuccin.palettes").get_palette("mocha")
      return {
        gui_style = {
          fg = "BOLD",
          bg = "BOLD"
        },
        highlight = {
          before = "fg",
          keyword = "fg",
          after = "fg",
        },
        colors = {
          error = { palette.red },
          warning = { palette.peach },
          info = { palette.blue },
          hint = { palette.yellow },
          default = { palette.mauve },
          test = { palette.rosewater }
        },
        keywords = {
          DEPRECATED = { icon = "󱡤 ", color = "warning" }
        }
      }
    end,
  }
}

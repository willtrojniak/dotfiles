return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope theme=ivy<cr>", desc = "Todos" }
    },
    opts = function()
      local palette = require("catppuccin.palettes").get_palette("mocha")
      return {
        gui_style = {
          fg = "BOLD",
          bg = "BOLD"
        },
        highlight = {
          before = "",
          keyword = "fg",
          after = "",
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

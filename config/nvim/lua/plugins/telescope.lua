return {
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("telescope").load_extension("fzf")
        end
      },
    },
    cmd = "Telescope",
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        { "<leader>ff", builtin.buffers,          desc = "Switch Buffer" },
        { "<leader>fo", builtin.find_files,       desc = "Open File" },
        { "<leader>/",  builtin.live_grep,        desc = "Live Grep" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todos" }
      }
    end,
    opts = {
      pickers = {
        buffers = {
          theme = "ivy"
        },
        find_files = {
          border = true,
          borderchars = {
            -- prompt = { " " },
            results = { " " },
            -- preview = { " " },
          },
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          layout_config = {
            anchor = "S",
            height = vim.o.lines / 2,
            width = vim.o.columns,
            prompt_position = "top",
            preview_width = 0.6
          }
        },
        live_grep = {
          theme = "ivy"
        },
      },
      extensions = {
        ["ui-select"] = {
          theme = "dropdown"
        },
        ["fzf"] = {

        }
      }
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("ui-select")
    end
  }
}

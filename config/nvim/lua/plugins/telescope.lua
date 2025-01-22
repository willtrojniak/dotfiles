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
      defaults = {
        file_ignore_patterns = {
          "vendor/",
        },
      },
      pickers = {
        buffers = {
          theme = "ivy",
          sorting_strategy = "descending",
        },
        find_files = {
          theme = "ivy",
          sorting_strategy = "descending",
        },
        live_grep = {
          theme = "ivy",
          sorting_strategy = "descending",
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

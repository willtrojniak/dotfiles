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
      },
    },
    cmd = "Telescope",
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        { "<leader>,", builtin.buffers, desc = "Switch Buffer" },
        { "<leader>.", builtin.find_files, desc = "Find Files" },
        { "<leader>/", builtin.live_grep, desc = "Live Grep" },
      }
    end,
    opts = {
      pickers = {
        buffers = {
          theme = "cursor"
        },
        find_files = {
          theme = "cursor"
        },
        live_grep = {
          theme = "ivy"
        }
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts);
      require("telescope").load_extension("fzf")
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("ui-select")
    end
  }
}

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
        { "<leader>ff", builtin.buffers, desc = "Switch Buffer" },
        { "<leader>fo", builtin.find_files, desc = "Open File" },
        { "<leader>/",  builtin.live_grep, desc = "Live Grep" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todos" }
      }
    end,
    opts = {
      pickers = {
        buffers = {
          theme = "ivy"
          -- theme = "cursor",
          -- layout_config = {
          --   height = 16,
          --   width = 120,
          -- }
        },
        find_files = {
          theme = "ivy"
          -- theme = "cursor",
          -- layout_config = {
          --   height = 16,
          --   width = 120,
          -- }
        },
        live_grep = {
          theme = "ivy"
        },
      },
      extensions = {
        ["ui-select"] = {
          theme = "dropdown"
        },
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

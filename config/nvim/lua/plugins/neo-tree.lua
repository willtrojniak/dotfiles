return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true, -- close Neo-Tree if it is the last buffer left in the tab
    popup_border_style = "rounded",
    default_component_configs = {
      diagnostics = {
        symbols = {
          hint = "󰌵",
          info = "",
          warn = "",
          error = "",
        },
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- this can only be used in the git_status source
          renamed   = "󰁕",-- this can only be used in the git_status source
          -- Status type
          untracked = "?",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,

        never_show = {
          ".DS_Store",
        }
      }
    },
  },
  cmd = "Neotree",
  keys = function()
    local neotree = require("neo-tree.command")
    return{
      { '<leader>fe', function() neotree.execute({}) end, desc = "Open File Tree" },
      { '<leader>fE', function() neotree.execute({toggle=true}) end, desc = "Toggle File Tree" }
    }
  end,
}


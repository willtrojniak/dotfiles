return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = false, -- close Neo-Tree if it is the last buffer left in the tab
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


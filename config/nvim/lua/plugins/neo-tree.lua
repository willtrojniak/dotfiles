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
    enable_git_status = true,
    enable_diagnostics = true,
    enable_normal_mode_for_inputs = true,
    sort_case_insensitive = true,
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
          deleted   = "✖", -- this can only be used in the git_status source
          renamed   = "󰁕", -- this can only be used in the git_status source
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
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {
          ".DS_Store",
        },
      },
      follow_current_file = {
        enabled = true,
      },
    },
  },
  cmd = "Neotree",
  keys = {
    { '<leader>fe', desc = "Open File Tree Explorer" },
    { '<leader>fg', desc = "Open Git Tree Explorer" },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    local neotree = require("neo-tree.command")
    local wk = require("which-key")
    wk.add({
      { '<leader>fe', function() neotree.execute({ action = 'focus', source = 'filesystem', position = 'float', reveal = true }) end, desc = "Open File Tree Explorer" },
      { '<leader>fg', function() neotree.execute({ action = 'focus', source = 'git_status', position = 'float', reveal = true }) end, desc = "Open Git Tree Explorer" },
    })
  end,
}

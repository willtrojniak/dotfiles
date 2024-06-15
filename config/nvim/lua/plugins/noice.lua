return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp"
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = "cmdline_popup",
      format = {
        search_down = {view = "cmdline"},
        search_up = {view = "cmdline"},
      },
    },
    notify =  {
      enabled = true,
      view = "mini"
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "messages",
      view_search = "virtualtext"
    },
    views = {
      timeout = 5000,
      mini = {
        position = {
          row = -1,
          col = 0,
        }
      },
      cmdline_popup = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        border = {
          style = "none",
          padding = {1, 2},
        },
        size = {
          width = 60,
          height = "auto",
        },
        win_options = {
          winhighlight="NormalFloat:NormalFloat,FloatBorder:FloatBorder"
        }
      },
      popup = {
        border = {
          style = "single",
          padding = {0, 1},
        },
        size = {
          width = "90%"
        }
      },
      popupmenu = {
        relative = "editor",
        scrollbar = "false",
        position = "auto",
        border = {
          style = "none",
          padding = {1, 2},
        },
        size = {
          width = 24,
          height = "auto",
          max_height = 6
        },
        win_options = {
          winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder"}
        }
      },
      hover = {
        border = {
          style = "single",
          padding = {0, 1}
        },
        position = {
          row = 2,
          col = 2
        }
      },
    },
  },
}

return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    auto_jump = false,
    indent_guides = true,
    warn_no_results = false,
    open_no_results = false,
    auto_close = true,
    modes = {
      lsp_base = {
        params = {
          include_current = true
        }
      },
      lsp_references = {
        auto_refresh = false,
        params = {
          include_declaration = false
        }
      },
      symbols = {
        mode = "lsp_document_symbols",
        focus = false,
        win = {
          position = "right",
          size = {width = 60 }
        }
      }
    }
  },
  cmd = "Trouble",
    keys = {
    {
      "<leader>ii",
      "<cmd>Trouble diagnostics open <cr>",
      desc = "Issues (Focus)",
    },
    {
      "<leader>iI",
      "<cmd>Trouble diagnostics open filter.buf=0<cr>",
      desc = "Buffer Issues (Focus)",
    },
    {
      "<leader>ir",
      "<cmd>Trouble lsp_references open auto_jump=false <cr>",
      desc = "References (Focus)",
    },
    {
      "<leader>is",
      "<cmd>Trouble symbols toggle<cr>",
      desc = "Symbols",
    },
    {
      "<leader>iS",
      "<cmd>Trouble symbols open focus=true<cr>",
      desc = "Symbols (Focus)",
    },
  },
}

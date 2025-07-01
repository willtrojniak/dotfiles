return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      }
    }
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    opts = {},
    event = { "BufReadPre", "BufWritePre", "BufNewFile" },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      }
    },
    config = function()
      local wk = require("which-key")
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          wk.add({
            { "K",          vim.lsp.buf.hover,           buffer = ev.buf, desc = "Hover" },
            { "gD",         vim.lsp.buf.declaration,     buffer = ev.buf, desc = "Go to declaration" },
            { "gd",         vim.lsp.buf.definition,      buffer = ev.buf, desc = "Go to definition" },
            { "gi",         vim.lsp.buf.implementation,  buffer = ev.buf, desc = "Go to implementation" },
            { "gt",         vim.lsp.buf.type_definition, buffer = ev.buf, desc = "Go to type definition" },
            { "<leader>ia", vim.lsp.buf.code_action,     buffer = ev.buf, desc = "View actions" },
            { "<leader>io", vim.diagnostic.open_float,   buffer = ev.buf, desc = "Open float" },
          })
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then return end
          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = ev.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  }
}

--- Uses the lsp client to get the corresponding source/header file open it
---
--- @param client vim.lsp.Client
--- @param bufnr integer
local function switch_source_header(client, bufnr)
  local method_name = 'textDocument/switchSourceHeader'
  local params = vim.lsp.util.make_text_document_params(bufnr)
  client:request(method_name, params, function(err, result)
    if err then
      error(tostring(err))
    end
    if not result then
      vim.notify('corresponding file cannot be determined')
      return
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

return {
  {
    "mason-org/mason.nvim",
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "saghen/blink.cmp",
    },
    opts = {},
  },
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
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim"
    },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
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
          if client:supports_method('textDocument/switchSourceHeader') then
            wk.add({
              { "go", function() switch_source_header(client, 0) end, buffer = ev.buf, desc = 'Switch to source/header' }
            })
          end
        end,
      })
    end
  }
}

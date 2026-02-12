local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
  local server_name = vim.fn.fnamemodify(f, ':t:r')
  table.insert(lsp_configs, server_name)
end

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,

  float = {
    border = "rounded",
    source = false
  }
})

vim.lsp.enable(lsp_configs)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
    vim.keymap.set({ "n", "v" }, "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
    vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
    vim.keymap.set({ "n", "v" }, "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
    vim.keymap.set({ "n", "v" }, "gt", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })
    vim.keymap.set({ "n", "v" }, "<leader>ia", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "View actions" })
    vim.keymap.set({ "n", "v" }, "<leader>io", vim.diagnostic.open_float, { buffer = ev.buf, desc = "Open float" })
    vim.keymap.set({ "n", "v" }, "<leader>rr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename occurrences" })

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

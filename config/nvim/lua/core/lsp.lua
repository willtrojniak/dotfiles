-- Enable all lsp configurations in lsp directory
local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
  local server_name = vim.fn.fnamemodify(f, ':t:r')
  table.insert(lsp_configs, server_name)
end
vim.lsp.enable(lsp_configs)


-- Neovim diagnostic configurations
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


-- Callback on lsp client attach
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

-- Middleware to use rounded style on all lsp floating windows
local original_open_float = vim.lsp.util.open_floating_preview
local function open_floating_preview(contents, syntax, opts)
  opts = opts or {}

  opts.border = opts.border or 'rounded'
  return original_open_float(contents, syntax, opts)
end
vim.lsp.util.open_floating_preview = open_floating_preview

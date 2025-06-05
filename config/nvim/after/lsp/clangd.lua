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
  cmd = { 'clangd', "--header-insertion=never" },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    '.git',
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
  ---@param client vim.lsp.Client
  ---@param bufnr integer
  on_attach = function(client, bufnr)
    if not (client:supports_method('textDocument/switchSourceHeader')) then return end
    vim.keymap.set("n", "go", function() switch_source_header(client, bufnr) end, { desc = 'Go to source/header' })
  end
}

---@brief
---
--- `vscode-json-language-server` can be installed via `npm`:
--- ```sh
--- npm i -g vscode-langservers-extracted
--- ```
---
---@type vim.lsp.Config
return {
  cmd = { 'vscode-json-languageserver', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
}

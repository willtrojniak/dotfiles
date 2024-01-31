local lspServers = {

  "lua_ls",
  "eslint",
  "tsserver",
  "tailwindcss",
  "pylsp",
  "ltex",
}

return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim"
    },
    opts = {
      ensure_installed = lspServers,
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Actions" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, lspserver in ipairs(lspServers) do
        lspconfig[lspserver].setup({capabilities = capabilities})
      end
    end
  }
}

---@module "lazy"
---@type LazyPluginSpec
return {
  "willtrojniak/flipp.nvim",
  version = "*",
  ft = { "c", "cpp" },
  ---@module 'flipp'
  ---@type flipp.Opts
  opts = {},

  ---@module 'flipp'
  ---@param opts flipp.Opts
  config = function(opts)
    local flipp = require('flipp')
    flipp.setup(opts)

    vim.keymap.set({ "n", "v" }, "<leader>gd",
      "<cmd>FlippGenerate<cr>",
      { desc = "Generate definitions" })
  end
}

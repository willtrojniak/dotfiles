---@module "lazy"
---@type LazyPluginSpec
return {
  "williamtrojniak/flipp.nvim",
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
      flipp.get_fully_qualified_undefined_selected_declarations,
      { desc = "Generate definitions" })
  end
}

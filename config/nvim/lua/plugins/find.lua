return {
  {
    'nvim-mini/mini.pick',
    version = '*',
    keys = function()
      local minipick = require('mini.pick')
      return {
        { "<leader>fo", minipick.builtin.buffers,   desc = "Find Open Buffer" },
        { "<leader>ff", minipick.builtin.files,     desc = "Find File" },
        { "<leader>/",  minipick.builtin.grep_live, desc = "Live Grep" },
      }
    end,
    opts = {},
  }
}

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  opts = {
   cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup",
    }
  },
}

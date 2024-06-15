return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = (not jit.os:find("Windows")) and "make install_jsregexp" or nil, -- build not required,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }
  },
  event = "InsertEnter",
  keys = {
    { "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
  config = function(_, opts)
    require("luasnip").setup(opts)
    vim.api.nvim_create_autocmd('ModeChanged', {pattern = "*",
      callback = function ()
        if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == "n") or vim.v.event.old_mode == 'i')
          and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
          and not require("luasnip").session.jump_active
        then
          require("luasnip").unlink_current()
        end
      end
    })
  end
}

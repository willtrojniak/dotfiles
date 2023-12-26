return {
  "L3MON4D3/LuaSnip",
  tag = "v2.1.1",
  build = (not jit.os:find("Windows")) and "make install_jsregexp" or nil, -- build not required,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }
  }
}

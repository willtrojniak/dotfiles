return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",

    opts = {
      keymap = { preset = 'super-tab' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          }
        }
      },
    },
    opts_extend = { "sources.default" }
  },
}

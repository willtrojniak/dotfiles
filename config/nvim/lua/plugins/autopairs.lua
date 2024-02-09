return {
  "echasnovski/mini.pairs",
  version = '*',
  event = "InsertEnter",
  config = function (_, opts)
    require("mini.pairs").setup(opts);
    vim.g.minipairs_disable = false;
  end
}


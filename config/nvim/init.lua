local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")

---@module "lazy"
---@type LazyConfig
local lazyOptions = {
  defaults = {
    lazy = true,
  },
  rocks = {
    enabled = false,
  },
  dev = {
    path = "~/dev/plugins/nvim/",
    patterns = { "willtrojniak" },
    fallback = true
  },
  install = {
    missing = true,
    colorscheme = { "catppuccin" }
  },
}

require("lazy").setup("plugins", lazyOptions)

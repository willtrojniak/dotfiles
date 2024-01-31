vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.opt

set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.number = true
set.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local lazyOptions = {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "catppuccin" }
  },
}

require("lazy").setup("plugins", lazyOptions)



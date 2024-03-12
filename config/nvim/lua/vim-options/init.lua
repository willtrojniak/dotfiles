-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.vimtex_view_method = 'zathura'

local set = vim.opt

-- Enable relative line numbers
set.number = true
set.relativenumber = true

-- Set tabs to two spaces
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2

-- Enable auto indenting and set it to spaces
set.smartindent = true
set.shiftwidth = 2

-- Enable ignorecase and smartcase for better searching
set.ignorecase = true
set.smartcase = true

-- Enable persistent undo history
set.undofile = true

-- Enable 24-bit color
set.termguicolors = true

-- Enable sign column always
set.signcolumn = "yes"

-- Disable line wrapping
set.wrap = false

-- Enable cursor line highlight
set.cursorline = true

-- Always keep at least 8 lines above/below cursor
set.scrolloff = 12

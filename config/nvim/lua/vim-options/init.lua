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

-- Case-insensitive searching unless \C or capital letter in search term
set.ignorecase = true
set.smartcase = true

-- Highlight on search, clear on pressing <Esc> in normal mode
set.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Decrease update time
set.updatetime = 250

-- Turn off mapped sequence timeout
set.timeout = false

-- Remove arrow key functionality
vim.keymap.set({ 'n', 'v' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'v' }, '<Right>', '<Nop>')
vim.keymap.set({ 'n', 'v' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'v' }, '<Down>', '<Nop>')

-- Center cursor on page up and down
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { noremap = true, desc = "Page up" });
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { noremap = true, desc = "Page down" });


-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

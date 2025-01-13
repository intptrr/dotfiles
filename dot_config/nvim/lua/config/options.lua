-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- cursor related
opt.ruler = true -- show cursor line number and position on the status bar
opt.guicursor = "n-v-c-i:block" -- change cursor to block for all modes

-- change line number to be relative
opt.number = true
opt.relativenumber = true

-- set indent and space
opt.expandtab = true -- use spaces instead of tabs
opt.shiftround = true -- round the indent
opt.tabstop = 2 -- number of spaces in the tab
opt.shiftwidth = 2 -- size of a indent


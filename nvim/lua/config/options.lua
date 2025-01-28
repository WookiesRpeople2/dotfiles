-- lua/config/options.lua

local opt = vim.opt



-- Leader keys

vim.g.mapleader = ' '

vim.g.maplocalleader = ' '



-- Line numbers

opt.number = true

opt.relativenumber = true



-- Tabs & indentation

opt.tabstop = 2

opt.shiftwidth = 2

opt.expandtab = true

opt.smartindent = true



-- Search

opt.ignorecase = true

opt.smartcase = true



-- Appearance

opt.termguicolors = true

opt.signcolumn = "yes"

opt.cmdheight = 1

opt.scrolloff = 10

opt.completeopt = "menuone,noselect"



-- Backspace

opt.backspace = "indent,eol,start"



-- Clipboard

opt.clipboard:append("unnamedplus")



-- Split windows

opt.splitright = true

opt.splitbelow = true

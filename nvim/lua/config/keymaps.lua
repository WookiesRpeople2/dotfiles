-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set


keymap('n', '<leader>cw', ':w<CR>', { noremap = true, silent = true })

keymap('n', '<leader>fnR', ':%s/;/{}/g', {noremap = true, silent= true})

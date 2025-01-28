-- lua/config/keymaps.lua

local keymap = vim.keymap.set



-- Window navigation

keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })

keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })



-- Save and quit

keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })



-- Custom Q command for save-all-and-quit

vim.api.nvim_create_user_command('Q', function()

  vim.cmd('wa')

  vim.cmd('qa')

end, {})



-- Better indenting

keymap('v', '<', '<gv', { noremap = true, silent = true })

keymap('v', '>', '>gv', { noremap = true, silent = true })



-- Move text up and down

keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

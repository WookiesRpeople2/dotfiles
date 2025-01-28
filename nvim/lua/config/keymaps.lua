-- lua/config/keymaps.lua

local keymap = vim.keymap.set



-- Window navigation

keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })

keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Tab management
keymap('n', '<leader>ta', ':$tabnew<CR>', opts)
keymap('n', '<leader>tc', ':tabclose<CR>', opts)

keymap('n', '<leader>to', ':tabonly<CR>', opts)
keymap('n', '<leader>tn', ':tabn<CR>', opts)
keymap('n', '<leader>tp', ':tabp<CR>', opts)

-- Move current tab to previous position
keymap('n', '<leader>tmp', ':-tabmove<CR>', opts)

-- Move current tab to next position
keymap('n', '<leader>tmn', ':+tabmove<CR>', opts)


-- Quick tab navigation
keymap('n', '<leader>1', '1gt', opts)
keymap('n', '<leader>2', '2gt', opts)
keymap('n', '<leader>3', '3gt', opts)
keymap('n', '<leader>4', '4gt', opts)
keymap('n', '<leader>5', '5gt', opts)


-- Split window
keymap('n', '<leader>sv', ':vsplit<CR>', opts)  -- Split vertically
keymap('n', '<leader>sh', ':split<CR>', opts)   -- Split horizontally



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

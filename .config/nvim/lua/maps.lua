-- Mapping-wide Settings
local set = vim.opt
local map = vim.api.nvim_set_keymap
options = { noremap = true }

-- Map Leader
vim.g.mapleader = " "

-- Remap omnicompletion
map('i', '<Tab>', '<C-n>', options)

-- Split Navigation
map('n', '<C-J>', '<C-W><C-J>', options)
map('n', '<C-K>', '<C-W><C-K>', options)
map('n', '<C-L>', '<C-W><C-L>', options)
map('n', '<C-H>', '<C-W><C-H>', options)
map('n', '<leader>th', '<C-W>H', options)
map('n', '<leader>tk', '<C-W>K', options)
map('n', '<leader>tj', '<C-W>J', options)
map('n', '<leader>tl', '<C-W>L', options)

-- Hard Mode
map('n', '<Up>', '', options)
map('n', '<Down>', '', options)
map('n', '<Left>', '', options)
map('n', '<Right>', '', options)

-- Auto-center and go by screen lines
map('n', 'j', 'gjzz', options)
map('n', 'k', 'gkzz', options)
map('n', 'n', 'gnzz', options)
map('n', 'N', 'gNzz', options)
map('v', 'j', 'gjzz', options)
map('v', 'k', 'gkzz', options)
map('v', 'v', 'gvzz', options)
map('v', 'N', 'gNzz', options)

-- Neoformat
map('n', '<leader>nf', ':Neoformat<CR>', options)

-- Yank Citations
map('n', '<leader>yc', [[:g/^$\|abstract\|language\|keyword\|isbn/d<CR>:w<CR>:%y<CR><C-O>]], options)

-- Ctrl S to Save
map('n', '<C-S>', ':w<CR>', options)
map('i', '<C-S>', '<ESC>:w<CR>', options)

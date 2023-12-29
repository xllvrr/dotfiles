-- Mapping-wide Settings
local set = vim.opt
local map = vim.api.nvim_set_keymap
options = { noremap = true }

-- Map Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

-- Formatting
map('n', '<leader>nf', '<ESC><cmd>lua vim.lsp.buf.format({ async = true })<CR>', options)
map('v', '<leader>nf', '<ESC><cmd>lua vim.lsp.buf.format({ async = true })<CR>', options)

-- Yank Citations
map('n', '<leader>yc', [[:g/^$\|abstract\|language\|keyword\|isbn/d<CR>:w<CR>:%y<CR><C-O><C-O>G]], options)

-- Easy Save
map('n', '<leader>w', ':w<CR>', options)

-- Open Terminals
map('n', '<leader>vt', ':vs term://zsh<CR>', options)
map('n', '<leader>ht', ':sp term://zsh<CR>', options)

-- Neotree
map('n', '<leader>nt', ':Neotree show<CR>', options)
map('n', '<leader>nc', ':Neotree close<CR>', options)
map('n', '<leader>gs', ':Neotree float git_status<CR>', options)

-- Deselect
map('n', '<leader><Space>', ':noh<CR>', options)
map('v', '<leader><Space>', ':noh<CR>', options)

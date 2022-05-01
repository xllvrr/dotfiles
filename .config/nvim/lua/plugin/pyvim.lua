-- Autocommands
vim.cmd('autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif')
vim.cmd('au BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py')
vim.cmd('autocmd FileType python map <buffer> <leader>rc :w<CR>:exec "!ipython" shellescape(@%, 1)<CR>')
vim.cmd('autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Mappings
vim.g.nvim_ipy_perform_mappings = 0
local map = vim.api.nvim_set_keymap
options = { noremap = false }

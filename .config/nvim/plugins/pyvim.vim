" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Better highlighting
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
Plug 'terryma/vim-multiple-cursors'
au BufNewFile *.py 0r ~/.config/nvim/skeleton.py
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!ipython' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!ipython' shellescape(@%, 1)<CR>
Plug 'jmcantrell/vim-virtualenv'
Plug 'bfredl/nvim-ipy'
let g:nvim_ipy_perform_mappings = 0
nmap <silent> <leader>pt :IPython<CR>
map <leader>pr <Plug>(IPy-Run)
map <leader>pc <Plug>(IPy-RunCell)
map <leader>ps <Plug>(IPy-Interrupt)

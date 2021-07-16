" Plugins
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Better highlighting
Plug 'jmcantrell/vim-virtualenv'
Plug 'bfredl/nvim-ipy'
Plug 'terryma/vim-multiple-cursors'

" Autocommands
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
au BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py " Load Template
autocmd FileType python map <buffer> <leader>rc :w<CR>:exec '!ipython' shellescape(@%, 1)<CR>

" Mappings
let g:nvim_ipy_perform_mappings = 0
nmap <silent> <leader>pt :IPython<CR>
map <leader>pr <Plug>(IPy-Run)
map <leader>pc <Plug>(IPy-RunCell)
map <leader>ps <Plug>(IPy-Interrupt)

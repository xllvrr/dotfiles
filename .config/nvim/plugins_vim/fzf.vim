" Fzf
Plug 'junegunn/fzf.vim' " Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" Map Leader
let mapleader=" "

" Remap omnicompletion
inoremap <Tab> <C-n>

" Easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>th <C-W>H
nnoremap <leader>tk <C-W>K
nnoremap <leader>tj <C-W>J
nnoremap <leader>tl <C-W>L

" Hard Mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Auto-center and go by screen lines
nnoremap j gjzz
nnoremap k gkzz
nnoremap n gnzz
nnoremap N gNzz
vnoremap j gjzz
vnoremap k gkzz
vnoremap n gnzz
vnoremap N gNzz

nnoremap <leader>ff :Neoformat<CR>

call plug#begin('~/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'ctrlpvim/ctrlp.vim' " fzf
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'

Plug 'machakann/vim-highlightedyank' " For better highlighting in yank
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 1000 " set highlight duration time to 1000 ms, i.e., 1 second

Plug 'tmhedberg/SimpylFold' " Code Folding

Plug 'rizzatti/dash.vim' " Dash Search
nmap <silent> <leader>d <Plug>DashSearch<CR>

" Nerd Tree
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntax Highlighting
Plug 'vim-pandoc/vim-pandoc-syntax'

" Nvim R
Plug 'jalvesaq/Nvim-R'
let R_in_buffer=0
let R_tmux_split=1
nmap , <Plug>RDSendLine
vmap , <Plug>RDSendSelection
vmap ,e <Plug>RESendSelection
Plug 'gaalcaras/ncm-R'
Plug 'w0rp/ale'
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1

" Dash
Plug 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch<CR>

" Python Nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer
Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)
Plug 'terryma/vim-multiple-cursors'

call plug#end()

let g:airline_theme = 'codedark'
let g:NERDTreeGitStatusWithFlags = 1

" Basic Settings
syntax on
set number relativenumber 
set encoding=utf8
set expandtab
set shiftwidth=6
set softtabstop=6
set tabstop=6
set termguicolors
colorscheme codedark
let mapleader=" "

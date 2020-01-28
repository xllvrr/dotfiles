let mapleader=" "

call plug#begin('~/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'ctrlpvim/ctrlp.vim' " fzf

" Nerd Tree
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

" Syntax Highlighting
Plug 'vim-pandoc/vim-pandoc-syntax'

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

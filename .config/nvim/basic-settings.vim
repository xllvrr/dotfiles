" Basic settings
syntax on
filetype indent on
filetype plugin on
set number relativenumber
set smartcase
set linebreak
set autoindent
set encoding=utf8
set expandtab smarttab
set softtabstop=4 tabstop=4
set shiftwidth=4
set mouse=n
set foldmethod=syntax foldlevelstart=20
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set clipboard+=unnamedplus

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=200
set undoreload=2000
set history=1000

" Split direction
set splitright
set splitbelow

" Go to paths
set hidden
set path+=**

" Live precariously; but also make sure to save
set nobackup
set noswapfile

" For Autocompletion
set updatetime=300
set shortmess+=c

" Configuring netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

" Help file on the right
augroup vimrc_help
    autocmd!
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

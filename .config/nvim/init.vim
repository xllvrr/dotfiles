let mapleader=" "

call plug#begin('~/repos/plugged')

" Themeing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
let g:airline_theme = 'codedark'
colorscheme codedark

" General Use Plugins
Plug 'sbdchd/neoformat' " Formatting
Plug 'jiangmiao/auto-pairs' " Auto completion of pairs
Plug 'kovetskiy/sxhkd-vim' " Integration with sxhkd
Plug 'unblevable/quick-scope' " Navigation and Motions
Plug 'vimwiki/vimwiki' " Vimwiki
Plug 'lilydjwg/fcitx.vim' " Write in another language
Plug 'chrisbra/csv.vim' " CSV
Plug 'tpope/vim-commentary' " Commenting
Plug 'machakann/vim-highlightedyank' " For better highlighting when yanking
Plug 'ervandew/supertab' " Tab Completion
let g:SuperTabDefaultCompletionType = "context"

" Fzf
Plug 'junegunn/fzf.vim' " Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Enter for Confirm Completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Nvim R
Plug 'jalvesaq/Nvim-R'
let R_in_buffer=0
let R_term_cmd = 'tilix -a session-add-right -e'
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
nmap , <Plug>RDSendLine
vmap , <Plug>RDSendSelection
vmap ,e <Plug>RESendSelection
Plug 'jalvesaq/R-Vim-runtime' " Highlighting for Rmd and Rnw code chunks
au BufNewFile *.Rnw 0r ~/.config/nvim/skeleton.Rnw
au BufNewFile *.Rmd execute "0r ~/.config/nvim/".input("Template name: ").".Rmd"
au BufNewFile *.md execute "0r ~/.config/nvim/".input("Template name: ").".md"
au BufNewFile *.bib 0r ~/.config/nvim/skeleton.bib
augroup filetypedetect
    au! BufRead,BufNewFile *.r         setfiletype r
    au! BufRead,BufNewFile *.R         setfiletype r
augroup END 

" Latex
Plug 'LaTeX-Box-Team/LaTeX-Box' " TeX highlighting and compilation
let g:LatexBox_show_warnings = 1
let g:LatexBox_autojump = 1
let g:LatexBox_latexmk_async = 0
let g:tex_flavor = 'tex'
au BufNewFile *.tex 0r ~/.config/nvim/skeleton.tex
" Autosave TeX before Compiling
autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>ll :update!<CR>:Latexmk!<CR>

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

" TypeScript
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

call plug#end()

" Basic settings
syntax on
filetype indent on
filetype plugin on
set number relativenumber
set smartcase
set linebreak
set encoding=utf8
set autoindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set mouse=n
set history=1000
set foldmethod=syntax
set foldlevelstart=20
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set clipboard+=unnamedplus

" For Autocompletion
set updatetime=300
set shortmess+=c

" Split direction
set splitright
set splitbelow

" Terminal colors
set notermguicolors

" Go to paths
set hidden
set path+=**

" Live precariously; but also make sure to save
set nobackup
set noswapfile

" Reading Mail
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

" Configuring netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

" Mappings
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

" Vimwiki settings
if $HOSTNAME == 'archmain'
    let g:vimwiki_list = [{'path': '/mnt/media/VimWiki','syntax': 'markdown', 'ext': '.md'},
                \ {'path': '/mnt/media/VimWiki/Christian', 'syntax': 'markdown', 'ext':'md'},
                \ {'path': '/mnt/media/VimWiki/DnD', 'syntax': 'markdown', 'ext':'md'},
                \ {'path': '/mnt/media/VimWiki/Personal', 'syntax': 'markdown', 'ext':'md'},
                \ {'path': '/mnt/media/VimWiki/Projects', 'syntax': 'markdown', 'ext':'md'}]
elseif $HOSTNAME == 'archthink'
    let g:vimwiki_list = [{'path': '~/Documents/Vimwiki','syntax': 'markdown', 'ext': '.md'},
                \ {'path': '~/Documents/Vimwiki/Christian', 'syntax': 'markdown', 'ext':'md'},
                \ {'path': '~/Documents/Vimwiki/DnD', 'syntax': 'markdown', 'ext':'md'},
                \ {'path': '~/Documents/Vimwiki/Personal', 'syntax': 'markdown', 'ext':'md'},
                \ {'path': '~/Documents/Vimwiki/Projects', 'syntax': 'markdown', 'ext':'md'}]
endif
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 0
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" Help file on the right
augroup vimrc_help
    autocmd!
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=200
set undoreload=2000

" Neoformat Configuration
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_enabled_R = ['formatR']
let g:neoformat_enabled_Rnw = ['latexindent']
let g:neoformat_enabled_tex = ['latexindent']
let g:neoformat_enabled_xml = ['prettier']
let g:neoformat_enabled_go = ['gofmt']
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
nnoremap <leader>ff :Neoformat<CR>

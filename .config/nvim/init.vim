let mapleader=" "

call plug#begin('~/repos/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs' " Auto completion of pairs
Plug 'kovetskiy/sxhkd-vim' " Integration with sxhkd
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf.vim' " Fuzzy Search
Plug 'vimwiki/vimwiki' " Vimwiki

Plug 'machakann/vim-highlightedyank' " For better highlighting in yank
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 1000 " set highlight duration time to 1000 ms, i.e., 1 second

" Csv Reading
Plug 'chrisbra/csv.vim'
" Commenting
Plug 'tpope/vim-commentary'
" Syntax Highlighting
" Plug 'sheerun/vim-polyglot'
" Linting Code
Plug 'neomake/neomake'
" Autocomplete
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" SuperTab
Plug 'ervandew/supertab'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

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
Plug 'gaalcaras/ncm-R' " Code Completion for R
Plug 'roxma/nvim-yarp' " Dependency for ncm2
Plug 'ncm2/ncm2' " Snippets for ncm-R
augroup ncm2
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
    inoremap <c-c> <ESC>
augroup END
Plug 'ervandew/supertab' " Allow tab to autocomplete
au BufNewFile *.Rnw 0r ~/.config/nvim/skeleton.Rnw

" Latex
Plug 'LaTeX-Box-Team/LaTeX-Box' " TeX highlighting and compilation
let g:LatexBox_show_warnings = 1
let g:LatexBox_autojump = 1
let g:LatexBox_latexmk_async = 0

" Python
Plug 'ncm2/ncm2-jedi'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Better highlighting
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
Plug 'terryma/vim-multiple-cursors'
au BufNewFile *.py 0r ~/.config/nvim/skeleton.py
command! -nargs=* PT vsplit | terminal ipython
" Run Python Script
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Vim CmdLine
Plug 'jalvesaq/vimcmdline'
let cmdline_map_send = '<LocalLeader>l'
let cmdline_map_start = '<LocalLeader>s'
let cmdline_follow_colorscheme = 1
let cmdline_vsplit = 1
let cmdline_app = {}
let cmdline_term_width = 120
let g:cmdline_app = {"python": "ipython --no-autoindent --matplotlib"}

call plug#end()

let g:airline_theme = 'codedark'

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
set mouse=in
set history=1000
set foldmethod=syntax
set foldlevelstart=20

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

colorscheme codedark

" Configuring netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

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

" Vimwiki settings
let g:vimwiki_list = [{'path': '$HOME/GDrive/VimWiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" Clipboard settings
vnoremap Y "+y
nnoremap Y "+y
nnoremap P "+p

" Tab navigation
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Help file on the right
augroup vimrc_help
    autocmd!
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Autosave TeX before Compiling
autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>ll :update!<CR>:Latexmk!<CR>

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=200
set undoreload=2000

" Terminal commands
tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
command! -nargs=* TT tabnew | terminal <args>

" Quick reference
command! -nargs=* BibRef tabedit $HOME/repos/templates/bibtemplates.bib

" Auto-center and go by screen lines
nnoremap j gjzz
nnoremap k gkzz
nnoremap n gnzz
nnoremap N gNzz
vnoremap j gjzz
vnoremap k gkzz
vnoremap n gnzz
vnoremap N gNzz

" Neomake Maker Configuration
call neomake#configure#automake('nrwi', 500)
let g:neomake_python_enabled_makers = ['pep8', 'flake8']
let g:neomake_R_enabled_makers = ['lintr']
let g:neomake_Rnw_enabled_makers = ['pdflatex']
let g:neomake_bib_enabled_makers = ['bibtex']
let g:neomake_zsh_enabled_makers = ['zsh']

" Neoformat Configuration
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_enabled_R = ['formatR','styler']
let g:neoformat_enabled_Rnw = ['latexindent']
let g:neoformat_enabled_tex = ['latexindent']
let g:neoformat_enabled_xml = ['prettier']
" Binding
nnoremap <leader>fs :Neoformat

" Highlighting for Rnw files
augroup filetypedetect
    au! BufRead,BufNewFile *.r         setfiletype r
    au! BufRead,BufNewFile *.R         setfiletype r
augroup END

" Autosource Vim Conf on Save
augroup autosource
    au! BufWritePost $MYVIMRC source $MYVIMRC
augroup END

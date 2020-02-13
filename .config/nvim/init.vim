let mapleader=" "

call plug#begin('~/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy Search
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'

Plug 'machakann/vim-highlightedyank' " For better highlighting in yank
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 1000 " set highlight duration time to 1000 ms, i.e., 1 second

" Code Folding
Plug 'tmhedberg/SimpylFold' 

" Csv Reading
Plug 'chrisbra/csv.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Syntax Highlighting
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Linting Code
Plug 'neomake/neomake'

" SuperTab
Plug 'ervandew/supertab'

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
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <c-c> <ESC>
Plug 'ervandew/supertab' " Allow tab to autocomplete
Plug 'LaTeX-Box-Team/LaTeX-Box' " Latex highlighting

" Nvim Py 
Plug 'ncm2/ncm2-jedi'
Plug 'davidhalter/jedi-vim'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer
Plug 'terryma/vim-multiple-cursors'

call plug#end()

let g:airline_theme = 'codedark'

" Basic Settings
syntax on
set number relativenumber 
set encoding=utf8
set expandtab
set shiftwidth=6
set softtabstop=6
set tabstop=6
set termguicolors
set mouse=in

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

" Help file on the right
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Auto-center and go by screen lines
nnoremap j gjzz
nnoremap k gkzz
nnoremap n gnzz
nnoremap N gNzz

" Neomake Maker Configuration
call neomake#configure#automake('nrwi', 500)
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_R_enabled_makers = ['lintr']
let g:neomake_Rnw_enabled_makers = ['pdflatex']
let g:neomake_bib_enabled_makers = ['bibtex']

" Highlighting for Rnw files
augroup filetypedetect
  au! BufRead,BufNewFile *.r         setfiletype r
  au! BufRead,BufNewFile *.R         setfiletype r
augroup END

" Autosource Vim Conf on Save
augroup autosource
  au! BufWrite ~/.config/nvim/init.vim source %
augroup END

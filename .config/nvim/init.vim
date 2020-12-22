let mapleader=" "

call plug#begin('~/repos/plugged')

" Themeing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'

" General Use Plugins
Plug 'sbdchd/neoformat' " Formatting
Plug 'jiangmiao/auto-pairs' " Auto completion of pairs
Plug 'kovetskiy/sxhkd-vim' " Integration with sxhkd
Plug 'unblevable/quick-scope' " Navigation and Motions
Plug 'vimwiki/vimwiki' " Vimwiki
Plug 'lilydjwg/fcitx.vim' " Write in another language

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }} 
" Git
Plug 'tpope/vim-fugitive'
" Csv Reading
Plug 'chrisbra/csv.vim'
" Commenting
Plug 'tpope/vim-commentary'
" Autocompletion
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" Fzf
Plug 'junegunn/fzf.vim' " Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" Easy Motion
Plug 'easymotion/vim-easymotion'
nmap <leader><leader>. <Plug>(easymotion-repeat)
nmap <leader><leader>j <Plug>(easymotion-sol-j)
nmap <leader><leader>k <Plug>(easymotion-sol-k)

Plug 'machakann/vim-highlightedyank' " For better highlighting in yank
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 1000 " set highlight duration time to 1000 ms, i.e., 1 second

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Enter for Confirm Completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
au BufNewFile *.Rnw 0r ~/.config/nvim/skeleton.Rnw
au BufNewFile *.Rmd execute "0r ~/.config/nvim/".input("Template name: ").".Rmd"
au BufNewFile *.md execute "0r ~/.config/nvim/".input("Template name: ").".md"
au BufNewFile *.bib 0r ~/.config/nvim/skeleton.bib

" Latex
Plug 'LaTeX-Box-Team/LaTeX-Box' " TeX highlighting and compilation
let g:LatexBox_show_warnings = 1
let g:LatexBox_autojump = 1
let g:LatexBox_latexmk_async = 0
let g:tex_flavor = 'tex'

" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Better highlighting
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
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
au FileType rmd let b:ipy_celldef = ['^```{r}$', '^```$']

" Vim Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>ga :cclose<CR>
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
" Function for either build or test
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

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

" VimDiff color scheme
if &diff
    colorscheme myscheme
endif

" Go to paths
set hidden
set path+=**

" Live precariously; but also make sure to save
set nobackup
set noswapfile

colorscheme codedark

" Reading Mail
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

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
let g:vimwiki_list = [{'path': '/mnt/media/GDrive/VimWiki','syntax': 'markdown', 'ext': '.md'},
            \ {'path': '/mnt/media/GDrive/VimWiki/Christian', 'syntax': 'markdown', 'ext':'md'},
            \ {'path': '/mnt/media/GDrive/VimWiki/DnD', 'syntax': 'markdown', 'ext':'md'},
            \ {'path': '/mnt/media/GDrive/VimWiki/Personal', 'syntax': 'markdown', 'ext':'md'},
            \ {'path': '/mnt/media/GDrive/VimWiki/Projects', 'syntax': 'markdown', 'ext':'md'}]
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 0
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
nnoremap mp :MarkdownPreview<CR>
nnoremap ms :MarkdownPreviewStop<CR>

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

" Auto-center and go by screen lines
nnoremap j gjzz
nnoremap k gkzz
nnoremap n gnzz
nnoremap N gNzz
vnoremap j gjzz
vnoremap k gkzz
vnoremap n gnzz
vnoremap N gNzz

" Neoformat Configuration
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_enabled_R = ['formatR']
let g:neoformat_enabled_Rnw = ['latexindent']
let g:neoformat_enabled_tex = ['latexindent']
let g:neoformat_enabled_xml = ['prettier']
let g:neoformat_enabled_go = ['gofmt']
" Binding
nnoremap <leader>ff :Neoformat<CR>

" Highlighting for Rnw files
augroup filetypedetect
    au! BufRead,BufNewFile *.r         setfiletype r
    au! BufRead,BufNewFile *.R         setfiletype r
augroup END

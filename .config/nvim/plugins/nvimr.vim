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
au BufNewFile *.Rnw 0r ~/.config/nvim/templates/skeleton.Rnw
au BufNewFile *.Rmd execute "0r ~/.config/nvim/templates".input("Template name: ").".Rmd"
au BufNewFile *.md execute "0r ~/.config/nvim/templates".input("Template name: ").".md"
au BufNewFile *.bib 0r ~/.config/nvim/templates/skeleton.bib
augroup filetypedetect
    au! BufRead,BufNewFile *.r         setfiletype r
    au! BufRead,BufNewFile *.R         setfiletype r
augroup END 

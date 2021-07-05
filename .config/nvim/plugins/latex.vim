" Latex
Plug 'LaTeX-Box-Team/LaTeX-Box' " TeX highlighting and compilation
let g:LatexBox_show_warnings = 1
let g:LatexBox_autojump = 1
let g:LatexBox_latexmk_async = 0
let g:tex_flavor = 'tex'
au BufNewFile *.tex 0r ~/.config/nvim/skeleton.tex
" Autosave TeX before Compiling
autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>ll :update!<CR>:Latexmk!<CR>

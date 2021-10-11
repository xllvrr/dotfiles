-- Latex
vim.g.LatexBox_show_warnings = 1
vim.g.LatexBox_autojump = 1
vim.g.LatexBox_latexmk_async = 0
vim.g.tex_flavor = 'tex'
vim.cmd('au BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex')
-- Autosave TeX before Compiling
local autocmd = { autosave = {
        {'BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>ll :update!<CR>:Latexmk!<CR>'};
    },
    filetype = {
        {'BufNewFile,BufRead *.bib setfiletype bib'}
    }
}
local u = require('utils')
u.create_augroup(autocmd)

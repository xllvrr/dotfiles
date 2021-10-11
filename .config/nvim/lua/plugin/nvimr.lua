-- Nvim R
vim.cmd('let R_in_buffer = 0')
vim.cmd('let R_term_cmd = "tilix -a session-add-right -e"')
vim.g.rout_follow_colorscheme = 1
vim.g.Rout_more_colors = 1

-- Mappings for R
local map = vim.api.nvim_set_keymap
options = { noremap = true }
map('n', ',', '<Plug>RDSendLine', options)
map('v', ',', '<Plug>RDSendSelection', options)
map('v', ',e', '<Plug>RESendSelection', options)

-- Apply Templates
vim.cmd('au BufNewFile *.Rnw 0r ~/.config/nvim/templates/skeleton.Rnw')
vim.cmd('au BufNewFile *.Rmd execute "0r ~/.config/nvim/templates/".input("Template name: ").".Rmd"')
vim.cmd('au BufNewFile *.md execute "0r ~/.config/nvim/templates/".input("Template name: ").".md"')
vim.cmd('au BufNewFile *.bib 0r ~/.config/nvim/templates/skeleton.bib')

-- Detect Filetype
local u = require('utils')
local autocmds = {
    filetypedetect = {
    {'BufRead,BufNewFile *.r setfiletype r'};
    {'BufRead,BufNewFile *.R setfiletype r'};
    };
}

u.create_augroup(autocmds)

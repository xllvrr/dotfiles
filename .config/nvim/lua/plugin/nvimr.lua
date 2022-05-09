-- Nvim R
vim.cmd('let R_external_term = 0')
vim.cmd('let R_auto_start = 1')
vim.g.rout_follow_colorscheme = 1
vim.g.Rout_more_colors = 1

-- Mappings for R
local map = vim.api.nvim_set_keymap
options = { noremap = false }
map('n', '<localleader>,', '<Plug>RDSendLine', options)
map('v', '<localleader>,', '<Plug>RDSendSelection', options)
map('v', '<localleader>,e', '<Plug>RESendSelection', options)

-- Apply Templates
vim.cmd('au BufNewFile *.Rnw 0r ~/.config/nvim/templates/skeleton.Rnw')
vim.cmd('au BufNewFile *.Rmd execute "0r ~/.config/nvim/templates/".input("Template name: ").".Rmd"')
vim.cmd('au BufNewFile *.md execute "0r ~/.config/nvim/templates/".input("Template name: ").".md"')
vim.cmd('au BufNewFile *.bib 0r ~/.config/nvim/templates/skeleton.bib')


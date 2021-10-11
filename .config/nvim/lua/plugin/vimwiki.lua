-- Vimwiki
vim.cmd([[
if $HOSTNAME == 'archmain'
    let g:vimwiki_list = [{'path': '/mnt/media/VimWiki','syntax': 'markdown', 'ext': '.md'}]
elseif $HOSTNAME == 'archthink'
    let g:vimwiki_list = [{'path': '~/Documents/Vimwiki','syntax': 'markdown', 'ext': '.md'}]
endif
]])
vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_global_ext = 0
vim.cmd('au BufRead,BufNewFile *.wiki set filetype=vimwiki')

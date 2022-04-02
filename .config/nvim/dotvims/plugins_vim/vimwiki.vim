" Vimwiki
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

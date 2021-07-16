" ---- Mappings ----
source ~/.config/nvim/mappings.vim

" ---- Plugins ----
call plug#begin('~/repos/plugged')
source ~/.config/nvim/plugins/general.vim
source ~/.config/nvim/plugins/fzf.vim
" source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/nvimr.vim
source ~/.config/nvim/plugins/latex.vim
source ~/.config/nvim/plugins/pyvim.vim
source ~/.config/nvim/plugins/typescript.vim
call plug#end()

" ---- Basic Settings -----
source ~/.config/nvim/basic-settings.vim
source ~/.config/nvim/themeing.vim

" ---- Plugin Settings -----
source ~/.config/nvim/plugins/vimwiki.vim
" luafile ~/.config/nvim/plugins/compe-config.lua
source ~/.config/nvim/plugins/neoformat.vim

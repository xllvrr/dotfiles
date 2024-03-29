-- Aliasing
local set = vim.opt
local cmd = vim.cmd

-- Basic Settings
cmd('syntax on')
cmd('filetype plugin indent on')

set.number = true
set.relativenumber = true

set.smartcase = true
set.linebreak = true

set.autoindent = true
set.encoding = 'utf8'

set.shiftwidth = 4

set.mouse = 'n'

set.foldmethod = 'syntax'
set.foldlevelstart = 20

set.grepprg = 'rg --vimgrep --smart-case --follow'

set.conceallevel=2

set.clipboard = [[unnamed,unnamedplus]]

-- Tab Stuff
set.expandtab = true
set.smarttab = true
set.softtabstop = 4
set.tabstop = 4

-- Persistent Undo
set.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
set.undofile = true
set.undolevels = 200
set.undoreload = 2000
set.history = 1000

-- Split Direction
set.splitright = true
set.splitbelow = true

-- Paths
set.hidden = true
set.path = set.path + {'**'}

-- Live Precariously
set.backup = false
set.swapfile = false

-- Autocompletion
set.updatetime = 300
set.shortmess = set.shortmess + { c = true }

-- Netrw Configuration
vim.g.netrw_banner = 0
vim.g.netrw_banner = 2
vim.g.netrw_winsize = 25

-- Help File on Right
cmd([[
augroup vimrc_help
    autocmd!
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
]])

-- Filetype Detection
cmd([[
augroup filetypedetect
    au! BufRead,BufNewFile *.r         setfiletype r
    au! BufRead,BufNewFile *.R         setfiletype r
    au! BufRead,BufNewFile *.lua       setfiletype lua
    au! BufNewFile,BufRead *.bib       setfiletype bib
augroup END 
]])

-- Highlight Yank
cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])

-- Neotree
vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd "Neotree toggle"
      vim.g.neotree_opened = true
    end
  end,
})
set.acd=true

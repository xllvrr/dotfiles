local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   
    { -- LSP
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'williamboman/mason.nvim',
              build = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
        }
    },

    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },

    { -- NeoTree
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { 
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
    },

    { -- Themeing
    'hoob3rt/lualine.nvim',
    'tomasiser/vim-code-dark',
    },

    -- General Use Plugins
    'jiangmiao/auto-pairs', -- Auto completion of pairs
    'unblevable/quick-scope', -- Navigation and Motions
    'tpope/vim-commentary', -- Commenting
    'machakann/vim-sandwich', -- For controlling surroundings
    'tpope/vim-repeat', -- For repeating mappings
    'jesseleite/vim-noh', -- Remove highlighting on cursor move
    'b0o/mapx.nvim', -- Better mapping
    'sbdchd/neoformat', -- Formatting
    'lewis6991/gitsigns.nvim', -- Gitsigns

    { -- Telescope
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate'},
            {'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
                end}
        }
    },

    -- R
    'jalvesaq/Nvim-R',

})

return require('packer').startup(function(use)

    -- Packer
    use 'wbthomason/packer.nvim'

    -- Themeing
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'tomasiser/vim-code-dark'

    -- General Use Plugins
    use 'jiangmiao/auto-pairs' -- Auto completion of pairs
    use 'kovetskiy/sxhkd-vim' -- Integration with sxhkd
    use 'unblevable/quick-scope' -- Navigation and Motions
    use 'vimwiki/vimwiki' -- Vimwiki
    use 'chrisbra/csv.vim' -- CSV
    use 'tpope/vim-commentary' -- Commenting
    use 'machakann/vim-sandwich' -- For controlling surroundings
    use 'tpope/vim-repeat' -- For repeating mappings
    use 'jesseleite/vim-noh' -- Remove highlighting on cursor move
    use 'b0o/mapx.nvim' -- Better mapping
    use 'sbdchd/neoformat' -- Formatting

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-treesitter/nvim-treesitter'}
        }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    require('telescope').load_extension('fzf')

    -- Refactoring
    use 'ThePrimeagen/refactoring.nvim'

    -- LSP and CMP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-buffer'
    use {'hrsh7th/nvim-cmp',
        requires = {'onsails/lspkind-nvim'}
    }
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- Latex
    use 'LaTeX-Box-Team/LaTeX-Box'

    -- R
    use 'jalvesaq/Nvim-R' -- R Programming
    use 'jalvesaq/R-Vim-runtime' -- Highlighting Rmd and Rnw Code Chunks

    -- Python
    use {'numirias/semshi', -- Better Highlighting
        cmd = 'UpdateRemotePlugins'
    }
    use 'bfredl/nvim-ipy'
    use 'hkupty/iron.nvim'

    -- TypeScript
    use 'pangloss/vim-javascript'     -- JavaScript support
    use 'leafgarland/typescript-vim'  -- TypeScript syntax
    use 'maxmellon/vim-jsx-pretty'    -- JS and JSX syntax
    use 'jparise/vim-graphql'         -- GraphQL syntax

    -- SQL
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui' -- UI for SQL

end)


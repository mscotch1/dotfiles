return {
    {
      'catppuccin/nvim', name='catppuccin'
    },
    {
        'sainnhe/everforest',
        init = function()
            require('plugin-config.everforest')
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        init = function()
            require('plugin-config.gitsigns')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        init = function()
            require('plugin-config.lualine')
        end
    },
    {
        'williamboman/mason.nvim',
        init = function()
            require('plugin-config.mason')
        end
    },
    {
        'preservim/nerdcommenter',
        init = function()
            require('plugin-config.nerdcommenter')
        end
    },
    {
        'hrsh7th/nvim-compe',
        init = function()
            require('plugin-config.nvim-compe')
        end
    },
    {
        'neovim/nvim-lspconfig',
        init = function()
            require('plugin-config.nvim-lspconfig')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        init = function()
            require('plugin-config.nvim-treesitter')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        init = function()
        end
    },
    {
        'nvim-lua/plenary.nvim',
        init = function()
            require('plugin-config.plenary')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        init = function()
            require('plugin-config.telescope')
        end
    },
    {
        'folke/tokyonight.nvim',
        init = function()
            require('plugin-config.tokyonight')
        end
    },
    {
        'ryanoasis/vim-devicons',
        init = function()
            require('plugin-config.vim-devicons')
        end
    },
    {
        'tpope/vim-fugitive',
        init = function()
            require('plugin-config.vim-fugitive')
        end
    },
    {
        'folke/zen-mode.nvim',
        init = function()
            require('plugin-config.zen-mode')
        end
    }
}


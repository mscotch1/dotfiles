return {
    {
        url = 'lewis6991/gitsigns.nvim',
        init = function()
            require('plugin-config.gitsigns')
        end
    },
    {
        url = 'sainnhe/everforest',
        init = function()
            require('plugin-config.everforest')
        end
    },
    {
        url = 'nvim-lualine/lualine.nvim',
        init = function()
            require('plugin-config.lualine')
        end
    },
    {
        url = 'williamboman/mason.nvim',
        init = function()
            require('plugin-config.mason')
        end
    },
    {
        url = 'preservim/nerdcommenter',
        init = function()
            require('plugin-config.nerdcommenter')
        end
    },
    {
        url = 'hrsh7th/nvim-compe',
        init = function()
            require('plugin-config.nvim-compe')
        end
    },
    {
        url = 'neovim/nvim-lspconfig',
        init = function()
            require('plugin-config.nvim-lspconfig')
        end
    },
    {
        url = 'nvim-treesitter/nvim-treesitter',
        init = function()
            require('plugin-config.nvim-treesitter')
        end
    },
    {
        url = 'nvim-lua/plenary.nvim',
        init = function()
            require('plugin-config.plenary')
        end
    },
    {
        url = 'nvim-telescope/telescope.nvim',
        init = function()
            require('plugin-config.telescope')
        end
    },
    {
        url = 'ryanoasis/vim-devicons',
        init = function()
            require('plugin-config.vim-devicons')
        end
    },
    {
        url = 'tpope/vim-fugitive',
        init = function()
            require('plugin-config.vim-fugitive')
        end
    },
    {
        url = 'folke/zen-mode.nvim',
        init = function()
            require('plugin-config.zen-mode')
        end
    }
}


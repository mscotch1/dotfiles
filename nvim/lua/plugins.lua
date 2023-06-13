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
        'mfussenegger/nvim-dap',
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
        },
        --config = function(_, opts)
            --local path = '~/.local/'
        --end
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
        'jose-elias-alvarez/null-ls.nvim',
        init = function()
        end,
        ft = {'python', 'js', 'ts'},
        opts = function()
          return require('plugin-config.null-ls')
        end,
    },
    {
        'nvim-lua/plenary.nvim',
        init = function()
            require('plugin-config.plenary')
        end
    },
    {
        'tpope/vim-surround',
        init = function()
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


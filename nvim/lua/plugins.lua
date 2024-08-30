return {
    {
      'catppuccin/nvim', name='catppuccin'
    },
    {
      'eandrju/cellular-automaton.nvim',
    },
    {
        'sainnhe/everforest',
        init = function()
            require('plugin-config.everforest')
        end
    },
    {
        'nvim-colortils/colortils.nvim',
        init = function()
            require('plugin-config.colortils')
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
        end,
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
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
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        init = function()
          local cmp = require 'cmp'
          local luasnip = require 'luasnip'
          cmp.setup {
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert {
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete {},
              ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              },
              ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { 'i', 's' }),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { 'i', 's' }),
            },
            sources = {
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            },
          }
        end
    },
    {
        'mfussenegger/nvim-dap',
        init = function()
            require('plugin-config.nvim-dap')
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup({
                controls = {
                    enabled = true,
                    element = "repl",
                    icons = {
                        pause = "",
                        play = "",
                        step_into = "",
                        step_over = "",
                        step_out = "",
                        step_back = "",
                        run_last = "↻",
                        terminate = "□",
                    },
                }
            })
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
    --{
        --'mfussenegger/nvim-dap-python',
        --ft = 'python',
        --dependencies = {
            --'mfussenegger/nvim-dap',
            --'rcarriga/nvim-dap-ui',
        --},
        ----config = function(_, opts)
            ----local path = '~/.local/'
        ----end
    --},
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
        'kyazdani42/nvim-web-devicons',
        init = function()
        end
    },
    {
        'nvimtools/none-ls.nvim',
        init = function()
        end,
        ft = {'python', 'js', 'ts'},
        opts = function()
          return require('plugin-config.none-ls')
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
        'nvim-telescope/telescope-live-grep-args.nvim',
        init = function()
        end
    },
    {
        'folke/tokyonight.nvim',
        init = function()
            require('plugin-config.tokyonight')
        end
    },
    {
      'rose-pine/neovim',
      name = 'rose-pine',
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


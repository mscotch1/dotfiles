return {
    {
      'catppuccin/nvim', name='catppuccin'
    },
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    { 'rebelot/kanagawa.nvim', name = 'kanagawa-theme' },
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
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = 'rafamadriz/friendly-snippets',

      -- use a release tag to download pre-built binaries
      version = '*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = 'super-tab' },

        appearance = {
          -- Sets the fallback highlight groups to nvim-cmp's highlight groups
          -- Useful for when your theme doesn't support blink.cmp
          -- Will be removed in a future release
          use_nvim_cmp_as_default = true,
          -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      },
      opts_extend = { "sources.default" }
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
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        -- example using `opts` for defining servers
        opts = {
          servers = {
            lua_ls = {}
          }
        },
        config = function(_, opts)
          local lspconfig = require('lspconfig')
          for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
          end
        end,

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
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
          require('plugin-config/fzflua')
        end,
        config = function()
          require('fzf-lua').setup({
            defaults = {
              --git_icons = false,
              --file_icons = false,
              --color_icons = false,
            },
            winopts = {
                -- split = "belowright new",-- open in a split instead?
                        -- "belowright new"  : split below
                        -- "aboveleft new"   : split above
                        -- "belowright vnew" : split right
                        -- "aboveleft vnew   : split left
                -- Only valid when using a float window
                -- (i.e. when 'split' is not defined, default)
                height           = 0.85,            -- window height
                width            = 0.80,            -- window width
                row              = 0.35,            -- window row position (0=top, 1=bottom)
                col              = 0.50,            -- window col position (0=left, 1=right)
                -- border argument passthrough to nvim_open_win(), also used
                -- 'none', 'single', 'double', 'thicc' (+cc) or 'rounded' (default)
                border           = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
                backdrop         = 60,
                -- title         = "Title",
                -- title_pos     = "center",    -- 'left', 'center' or 'right'
                fullscreen       = false,           -- start fullscreen?
                -- enable treesitter highlighting for the main fzf window will only have
                -- effect where grep like results are present, i.e. "file:line:col:text"
                -- due to highlight color collisions will also override `fzf_colors`
                -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
                treesitter       = {
                  enabled    = true,
                  fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
                },
                preview = {
                  -- default     = 'bat',           -- override the default previewer?
                                                    -- default uses the 'builtin' previewer
                  border         = 'border',        -- border|noborder, applies only to
                                                    -- native fzf previewers (bat/cat/git/etc)
                  wrap           = 'nowrap',        -- wrap|nowrap
                  hidden         = 'nohidden',      -- hidden|nohidden
                  vertical       = 'down:45%',      -- up|down:size
                  horizontal     = 'right:60%',     -- right|left:size
                  layout         = 'flex',          -- horizontal|vertical|flex
                  flip_columns   = 100,             -- #cols to switch to horizontal on flex
                  -- Only used with the builtin previewer:
                  title          = true,            -- preview border title (file/buf)?
                  title_pos      = "center",        -- left|center|right, title alignment
                  scrollbar      = 'float',         -- `false` or string:'float|border'
                                                    -- float:  in-window floating border
                                                    -- border: in-border "block" marker
                  scrolloff      = '-2',            -- float scrollbar offset from right
                                                    -- applies only when scrollbar = 'float'
                  delay          = 20,              -- delay(ms) displaying the preview
                                                    -- prevents lag on fast scrolling
                  winopts = {                       -- builtin previewer window options
                    number            = true,
                    relativenumber    = false,
                    cursorline        = true,
                    cursorlineopt     = 'both',
                    cursorcolumn      = false,
                    signcolumn        = 'no',
                    list              = false,
                    foldenable        = false,
                    foldmethod        = 'manual',
                  },
                },
                on_create = function()
                  -- called once upon creation of the fzf main window
                  -- can be used to add custom fzf-lua mappings, e.g:
                  --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
                end,
                -- called once _after_ the fzf interface is closed
                -- on_close = function() ... end
            }
          })
        end
    },
    {
        'folke/tokyonight.nvim',
        init = function()
            require('plugin-config.tokyonight')
        end
    },
    --{
      --"folke/noice.nvim",
      --event = "VeryLazy",
      --opts = {
        ---- add any options here
      --},
      --dependencies = {
        ---- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        --"MunifTanjim/nui.nvim",
        ---- OPTIONAL:
        ----   `nvim-notify` is only needed, if you want to use the notification view.
        ----   If not available, we use `mini` as the fallback
        --"rcarriga/nvim-notify",
        --}
    --},
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


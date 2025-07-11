return {
  {
    'lewis6991/gitsigns.nvim',
    init = function()
      require('plugin-config.gitsigns')
    end
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
    },
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
      keymap = { preset = 'default' },
      -- keymap = { preset = 'super-tab' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = {
        implementation = 'lua',
      },
    },
    opts_extend = { "sources.default" }
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

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
    'nvim-lua/plenary.nvim',
    init = function()
      require('plugin-config.plenary')
    end
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('plugin-config/fzflua')
    end,
    config = function()
      require('plugin-config/fzflua-config')
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
  },
}


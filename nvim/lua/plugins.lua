return {
  -- Colorscheme (kept eager so UI doesn’t flash)
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000,
    init = function ()
      vim.cmd('set background=dark')
      vim.cmd.colorscheme('tokyonight')
    end
  },

  -- Git signs in gutter
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" }, -- only when opening a file
    config = function()
      require('plugin-config.gitsigns')
    end,
  },

  -- Mason: lazy load on command
  { 'williamboman/mason.nvim', cmd = "Mason" },
  { 'williamboman/mason-lspconfig.nvim', lazy = true },

  -- Statusline breadcrumbs
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy", -- defer until after startup
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      show_dirname = false,
      show_basename = false,
    },
  },

  -- Comment toggling
  {
    'preservim/nerdcommenter',
    init = function()
      require('plugin-config.nerdcommenter')
    end
  },

  -- Completion
  {
    'saghen/blink.cmp',
    event = "InsertEnter", -- load only when entering insert mode
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'lua' },
    },
    opts_extend = { "sources.default" }
  },

  -- LSP config
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    opts = {
      servers = {
        lua_ls = {}
      }
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, config)
      end
    end,

    init = function()
      require('plugin-config.nvim-lspconfig')
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require('plugin-config.nvim-treesitter')
    end
  },

  -- Lua helper
  { 'nvim-lua/plenary.nvim', lazy = true },

  -- Fuzzy finder
  {
    'ibhagwan/fzf-lua',
    cmd = "FzfLua", -- only when called
    event = "VeryLazy",
    config = function()
      require('plugin-config/fzflua-config')
    end
  },

  -- Icons
  { 'ryanoasis/vim-devicons', lazy = true },

  -- Git integration
  {
    'tpope/vim-fugitive',
    cmd = { "Git", "Gdiffsplit", "Gstatus" },
  },

  -- Distraction-free editing
  {
    'folke/zen-mode.nvim',
    cmd = "ZenMode",
    config = function()
      require('plugin-config.zen-mode')
    end
  },
}

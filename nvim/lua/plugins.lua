local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'sainnhe/everforest'
Plug 'nvim-lualine/lualine.nvim'
Plug 'williamboman/mason.nvim'
Plug 'preservim/nerdcommenter'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'folke/zen-mode.nvim'

vim.call('plug#end')

require('plugins.everforest')
require('plugins.lualine')
require('plugins.mason')
require('plugins.nerdcommenter')
require('plugins.nvim-compe')
require('plugins.nvim-lspconfig')
require('plugins.nvim-treesitter')
require('plugins.plenary')
require('plugins.telescope')
require('plugins.vim-devicons')
require('plugins.vim-fugitive')
require('plugins.vim-gitgutter')
require('plugins.zen-mode')

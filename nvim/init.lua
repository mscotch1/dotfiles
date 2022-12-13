require('options')

-- PLUGINS
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'airblade/vim-gitgutter'
Plug 'EdenEast/nightfox.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'williamboman/mason.nvim'

vim.call('plug#end')

-- COLORSCHEME
vim.cmd('colorscheme carbonfox')

-- MAPPINGS
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-P>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '--', ':Explore<Enter>')
vim.keymap.set('n', '-v', ':Vexplore<Enter>')
vim.keymap.set('n', '-s', ':Sexplore<Enter>')
vim.keymap.set('n', '-t', ':Texplore<Enter>')

vim.keymap.set('n', '<leader>sh', ':terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>')

-- OS-SPECIFIC
if vim.loop.os_uname().sysname == 'Linux'
then
    vim.keymap.set('n', '<leader>rc', ':e ~/.config/nvim/<Enter>')
else
    vim.keymap.set('n', '<leader>rc', ':e $LOCALAPPDATA/nvim/<Enter>')
    vim.o.shell = 'pwsh'
    vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellquote = ''
    vim.o.shellxquote= ''
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
-- https://github.com/iamcco/vim-language-server
require('lspconfig')['vimls'].setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-json-languageserver
require('lspconfig')['jsonls'].setup {
    on_attach = on_attach,
    cmd = {"json-languageserver", "--stdio"}
}

-- https://github.com/redhat-developer/yaml-language-server
require('lspconfig')['yamlls'].setup {on_attach = on_attach}

-- https://github.com/joe-re/sql-language-server
require('lspconfig')['sqlls'].setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-css-languageserver-bin
require('lspconfig')['cssls'].setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
require('lspconfig')['html'].setup {on_attach = on_attach}

require('lspconfig')['eslint'].setup{}

vim.o.completeopt = "menuone,noselect"
require'compe'.setup({
  enabled = true,
  autocomplete = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
  },
})

require'mason'.setup{}

require'nvim-treesitter.configs'.setup{}

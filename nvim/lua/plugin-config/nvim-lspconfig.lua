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
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>df', vim.diagnostic.setqflist)
  vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true
  })
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

--require('lspconfig')['pylsp'].setup{
    --on_attach = on_attach,
    --cmd = {"python", "-m", "pylsp"},
    --flags = lsp_flags,
    --settings = {
        --pylsp = {
            --plugins = {
                --pylint = { enabled = true },
                --yapf = { enabled = true },
                --pycodestyle = { enabled = true },
                --flake8 = { enabled = true },
            --},
        --},
    --},
--}

require('lspconfig')['pyright'].setup {on_attach = on_attach}

require('lspconfig')['ruff_lsp'].setup{on_attach = on_attach}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
--require('lspconfig')['rust_analyzer'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
    ---- Server-specific settings...
    --settings = {
      --["rust-analyzer"] = {}
    --}
--}
-- https://github.com/iamcco/vim-language-server
require('lspconfig')['vimls'].setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-json-languageserver
require('lspconfig')['jsonls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- cmd = {"vscode-json-languageserver.cmd", "--stdio"}
}

-- https://github.com/vscode-langservers/vscode-css-languageserver-bin
require('lspconfig')['cssls'].setup { on_attach = on_attach }

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
require('lspconfig')['html'].setup {on_attach = on_attach}

require('lspconfig')['eslint'].setup{on_attach = on_attach}

require('lspconfig')['vimls'].setup{on_attach = on_attach}

require('lspconfig')['yamlls'].setup{on_attach = on_attach}

require('lspconfig')['bufls'].setup{on_attach = on_attach}

--require('lspconfig')['clangd'].setup{on_attach = on_attach}

--require('lspconfig')['xml-formatter'].setup{on_attach = on_attach}

require('lspconfig')['intelephense'].setup{on_attach = on_attach}

require('lspconfig')['cmake'].setup{
  on_attach = on_attach,
  --cmd = { 'cmake-language-server' },
  --cmd = { 'C:/Users/Michael/AppData/Local/nvim-data/mason/bin/cmake-language-server.cmd' },
}

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '󰋼', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
--  2  6  1

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}
-- vim.api.nvim_exec('highlight FloatBorder ctermfg=NONE ctermbg=NONE cterm=NONE', {})

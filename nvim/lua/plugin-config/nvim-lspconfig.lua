require('mason').setup()

local is_linux = vim.loop.os_uname().sysname == 'Linux'
-- local is_windows = vim.loop.os_uname().sysname:match("Windows")

local servers = {
    'ts_ls', 'rust_analyzer', 'vimls', 'pylsp',
    'jsonls', 'cssls', 'html', 'eslint', 'yamlls', 'buf_ls', 'intelephense', 'cmake', 'clangd'
}

if is_linux then
    table.insert(servers, 'clangd') -- Only enable clangd on Linux
end

require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true
})

local mason_registry = require('mason-registry')

-- LSP on_attach function for keybindings
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>df', vim.diagnostic.setqflist, bufopts)
  vim.diagnostic.config({ virtual_text = true, severity_sort = true })
end

local lspconfig = require('lspconfig')
local lsp_flags = { debounce_text_changes = 150 }

-- Common LSP servers
for _, server in ipairs(servers) do
    lspconfig[server].setup { on_attach = on_attach, flags = lsp_flags }
end

-- Linux-specific LSP
if vim.loop.os_uname().sysname == 'Linux' then
    lspconfig['clangd'].setup{ on_attach = on_attach, cmd = {"clangd"} }
end


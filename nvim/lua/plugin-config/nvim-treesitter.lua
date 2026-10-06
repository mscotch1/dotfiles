require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site'
})

local langs = {
  bash = { '.sh' },
  c = { '.c', '.h' },
  cmake = { '.cmake' },
  cpp = { '.cpp', '.cxx', '.hpp', '.hxx' },
  css = { '.css' },
  html = { '.html' },
  javascript = { '.js', '.jsx' },
  json = { '.json' },
  lua = { '.lua' },
  luadoc = { '.lua' },
  markdown = { '.md' },
  markdown_inline = nil,
  proto = { '.proto' },
  python = { '.py' },
  toml = { '.toml' },
  typescript = { '.ts', '.tsx' },
  yaml = { '.yaml', '.yml' },
}

for lang, pattern in pairs(langs) do
  vim.treesitter.language.add(lang)

  if pattern ~= nil then
    vim.api.nvim_create_autocmd('FileType', {
      pattern = pattern,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end
end

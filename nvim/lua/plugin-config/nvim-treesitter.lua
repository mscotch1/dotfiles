require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
      },
    },
  },
})
-- vim.treesitter.language.add('python')
-- vim.treesitter.language.add('typescript')
-- vim.treesitter.language.add('javascript')



local fzf_lua = require('fzf-lua')

vim.keymap.set('n', '<C-P>', function()
  fzf_lua.files({
    -- can't do fancy prompt for files :(
  })
end, { silent = true })
vim.keymap.set('n', '<leader>gf', function()
  fzf_lua.git_files({
    prompt = ' ',
  })
end, { silent = true })
vim.keymap.set('n', '<leader>b', function()
  fzf_lua.buffers({
    prompt = ' ',
  })
end, { silent = true })
vim.keymap.set('n', '<leader>rg', function()
  fzf_lua.live_grep({
    prompt = ' ',
    rg_opts = "--pcre2 --hidden --column --line-number --no-heading --color=always --smart-case -e",
  })
end, { silent = true })

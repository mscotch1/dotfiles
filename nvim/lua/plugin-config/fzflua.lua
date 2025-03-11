local fzf_lua = require('fzf-lua')

vim.keymap.set('n', '<C-P>', fzf_lua.files, { silent = true })
vim.keymap.set('n', '<leader>gf', fzf_lua.git_files, { silent = true })
vim.keymap.set('n', '<leader>b', fzf_lua.buffers, { silent = true })
vim.keymap.set('n', '<leader>gs', fzf_lua.git_status, { silent = true })
vim.keymap.set('n', '<leader>rg', fzf_lua.live_grep, { silent = true })

vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { silent = true })

vim.keymap.set('n', '<leader>sh', ':terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>', { silent = true })

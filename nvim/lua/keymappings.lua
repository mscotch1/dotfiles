vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })

vim.keymap.set('n', '<leader>sh', ':terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>', { silent = true })

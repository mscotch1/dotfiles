vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })

vim.keymap.set('n', '<leader>sh', ':terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>', { silent = true })

vim.keymap.set('x', '<leader>y', '"+y')
vim.keymap.set('x', '<leader>p', '"+p')
vim.keymap.set('x', '<leader>P', '"+P')

vim.keymap.set('n', '<leader>gl', require'functions.gitlens'.blameVirtText, { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })

vim.keymap.set('n', '<leader><leader>', ':vsplit<Enter>:terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>a', { silent = true })
vim.keymap.set('t', '<Esc><leader>', '<C-\\><C-n>', { silent = true })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

vim.keymap.set('n', '<leader>gl', require'functions.gitlens'.blameVirtText, { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<C-Up>', ':cprev<Enter>')
vim.keymap.set('n', '<C-Down>', ':cnext<Enter>')


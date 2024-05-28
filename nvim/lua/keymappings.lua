vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })

-- git stuff
vim.keymap.set('n', '<leader>g', ':tabe<Enter>:set nonumber<Enter>:set norelativenumber<Enter>:terminal lazygit<Enter>a', { silent = true })
vim.keymap.set('n', '<leader>l', ':let @l=line(".")<Enter>:vertical G log --patch -L<C-R>l,+1:%<Enter>')
vim.keymap.set('v', '<leader>l', ':<C-w>let @l=line("\'<")<Enter>:let @m=line("\'>")<Enter>:vertical G log --patch -L<C-R>l,<C-R>m:%<Enter>')

vim.keymap.set('n', '<C-s>', ':b #<Enter>', { silent = true })

vim.keymap.set('n', '<leader>fp', ':let @" = expand("%")<Enter>', { silent = true })

vim.keymap.set('n', '<leader><leader>t', ':tabe<Enter>:terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>a', { silent = true })
vim.keymap.set('n', '<leader><leader>-t', ':-tabe<Enter>:terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>a', { silent = true })
vim.keymap.set('n', '<leader><leader>v', ':vsplit<Enter>:terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>a', { silent = true })
vim.keymap.set('n', '<leader><leader>s', ':split<Enter>:terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>a', { silent = true })
vim.keymap.set('t', '<Esc><leader>', '<C-\\><C-n>', { silent = true })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "<A-w>", ":tabc<Enter>", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

vim.keymap.set('n', '<C-Up>', ':cprev<Enter>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':cnext<Enter>', { silent = true })

vim.keymap.set('n', '<C-Left>', ':tabmove - <Enter>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':tabmove + <Enter>', { silent = true })

vim.keymap.set('n', '<C-b>', ':set scrollbind<Enter>', { silent = true })
vim.keymap.set('n', '<C-n>', ':set noscrollbind<Enter>', { silent = true })


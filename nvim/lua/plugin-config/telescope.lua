local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-P>', builtin.find_files, { silent = true })
vim.keymap.set('n', '<leader>ft', builtin.git_files, { silent = true })
vim.keymap.set('n', '<leader>b', builtin.buffers, { silent = true })
vim.keymap.set('n', '<leader>fs', builtin.git_status, { silent = true })

local extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>fg', extensions.live_grep_args.live_grep_args, { silent = true })

require('options')
require('plugins')
require('keymappings')

if vim.loop.os_uname().sysname == 'Linux'
then
    require('os.linux')
else
    require('os.windows')
end

vim.o.background = 'dark'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = true
vim.cmd('colorscheme everforest')

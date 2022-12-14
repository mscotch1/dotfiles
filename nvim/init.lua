require('plugins')
require('options')
require('keymappings')

if vim.loop.os_uname().sysname == 'Linux'
then
    require('os.linux')
else
    require('os.windows')
end

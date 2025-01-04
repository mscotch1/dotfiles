require('options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
  defaults = {
  }
})

require('functions')
require('keymappings')
require('autocmds')

if vim.loop.os_uname().sysname == 'Linux'
then
    require('os.linux')
else
    require('os.windows')
end

vim.cmd('colorscheme kanagawa-dragon')
--set_transparent()

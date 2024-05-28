vim.keymap.set('n', '<leader>rc', ':e $LOCALAPPDATA/nvim/<Enter>')
--vim.o.shell = 'nu.exe'
--vim.o.shellcmdflag = '-c'
--vim.o.shellredir = '| save'
--vim.o.shellquote = ''
--vim.o.shellxquote = ''
--vim.o.shelltemp = true
vim.o.shell = 'powershell'
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote= ''

vim.o.tabstop = 2
vim.o.shiftwidth = 2

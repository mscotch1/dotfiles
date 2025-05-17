--vim.api.nvim_command [[autocmd CursorHold   * lua require'functions.gitlens'.blameVirtText()]]
vim.api.nvim_command [[autocmd CursorMoved  * lua require'functions.gitlens'.clearBlameVirtText()]]
vim.api.nvim_command [[autocmd CursorMovedI * lua require'functions.gitlens'.clearBlameVirtText()]]
vim.api.nvim_command [[autocmd BufEnter,BufWritePost,BufWinEnter netrw* setlocal nomodified]]

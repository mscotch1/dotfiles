vim.o.updatetime = 100

vim.keymap.set('n', '<leader>gd', ':GitGutterDiffOrig<Enter>', { silent = true })
vim.keymap.set('n', '<leader>gh', ':GitGutterLineHighlightsToggle<Enter>', { silent = true })

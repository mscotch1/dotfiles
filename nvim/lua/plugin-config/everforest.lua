vim.o.background = 'dark'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = true

vim.cmd('colorscheme everforest')

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

vim.api.nvim_set_hl(0, "CursorLine", { bg = '#575757' })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = '#575757' })

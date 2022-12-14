vim.o.autoindent = true     -- indent a new line the same amount as the line just typed
vim.o.compatible = false    -- disable compatibility to old-time vi
vim.o.cursorline = true     -- highlight current cursorline
vim.o.expandtab = true      -- converts tabs to white space
vim.o.hlsearch = true       -- highlight search 
vim.o.ignorecase = true     -- case insensitive 
vim.o.incsearch = true      -- incremental search
vim.o.mouse = 'a'           -- enable mouse click
vim.o.number = true         -- add line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.shiftwidth = 4        -- width for autoindents
vim.o.showmatch = true      -- show matching 
vim.o.softtabstop = 4       -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.swapfile = false      -- disable creating swap file
vim.o.syntax = true         -- syntax highlighting
vim.o.tabstop = 4           -- number of columns occupied by a tab 
vim.o.termguicolors = true

vim.o.background = 'dark'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = true
vim.cmd('colorscheme everforest')

vim.g.mapleader = ' '

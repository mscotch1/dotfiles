zen = require('zen-mode')
zen.setup({});

vim.keymap.set('n', '<leader>zm', function() zen.toggle({
    window = { width = 0.55 }
}) end, {})

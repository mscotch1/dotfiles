vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })

vim.keymap.set('n', '<leader>sh', ':terminal<Enter>:set nonumber<Enter>:set norelativenumber<Enter>', { silent = true })

set_tab_width = function (str)
    if str == nil
    then
        return
    end
    value = tonumber(str)
    if value == nil
    then
        print(string.format('Invalid argument ["%s"]', str))
        return
    end
    vim.o.tabstop = math.floor(value)
    vim.o.shiftwidth = math.floor(value)
end

vim.keymap.set('n', '<leader>tw',
    function()
        vim.ui.input(
            { prompt = 'Enter new tab width: ' },
            set_tab_width
        )
    end
)

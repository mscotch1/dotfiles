function set_tab_width (str)
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

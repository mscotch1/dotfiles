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

function set_transparent ()
    vim.api.nvim_set_hl(0, "Normal", {})
    vim.api.nvim_set_hl(0, "NormalNC", {})
    --vim.api.nvim_set_hl(0, "NormalFloat", {})
    vim.api.nvim_set_hl(0, "TabLine", {})
    vim.api.nvim_set_hl(0, "TabLineFill", {})
    vim.api.nvim_set_hl(0, "EndOfBuffer", {})
    vim.api.nvim_set_hl(0, "StatusColumn", {})
end

vim.keymap.set('n', '<leader>tr', set_transparent)
vim.keymap.set('n', '<leader>tR',
    function()
        colorscheme = vim.api.nvim_exec('colorscheme', { output = true })
        vim.api.nvim_exec('colorscheme ' .. colorscheme, {})
    end
)

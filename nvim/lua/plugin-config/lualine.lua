require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        --disabled_filetypes = {
            --statusline = {},
            --winbar = {},
        --},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'windows'},
        lualine_c = {'filetype'},
        lualine_x = {{ 'diagnostics', symbols = {
          error = '',
          warn = '',
          info = '󰋼',
          hint = '',
        }}, 'location', 'progress'},
        lualine_y = {'diff', 'branch'},
        lualine_z = {'os.date("%a, %b %d %I:%M%p")'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {'tabs'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'buffers'}
    },
    winbar = {
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {},
    extensions = {}
}

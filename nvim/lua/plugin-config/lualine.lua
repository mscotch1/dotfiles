require('lualine').setup {
    options = {
        --icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        --component_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        --component_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        --disabled_filetypes = {
            --statusline = {},
            --winbar = {},
        --},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'filetype', 'encoding'},
        lualine_x = {'diff', 'diagnostics'},
        lualine_y = {'location'},
        lualine_z = {'progress'},
    },
    inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'filetype', 'encoding'},
        lualine_x = {'diff', 'diagnostics'},
        lualine_y = {'location'},
        lualine_z = {'progress'},
    },
    tabline = {
        lualine_a = {'tabs'},
        lualine_b = {'branch'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {{
          'windows',
          show_filename_only = true,
          filetype_names = {
            lazy = 'Lazy',
          },
          symbols = {
            modified = '~',      -- Text to show when the buffer is modified
            alternate_file = '#', -- Text to show to identify the alternate file
            directory =  '',     -- Text to show when the buffer is a directory
          },
        }},
        lualine_z = {'os.date("%a, %b %d %I:%M%p")'},
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

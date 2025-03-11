require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    --component_separators = '',
    --section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {{
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
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress', 'location'},
    lualine_z = {'os.date("%I:%M%p")'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {'tabs'},
      lualine_b = {'branch'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

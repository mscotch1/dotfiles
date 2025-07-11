local devicons = require('nvim-web-devicons');
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = '' },
    --component_separators = { left = '', right = '' },
    --section_separators = { left = '', right = '' },
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
    --lualine_b = {'diff', 'diagnostics'},
    --lualine_c = {'branch'},
    --lualine_x = {'encoding', 'filetype'},
    --lualine_y = {'progress', 'location'},
    lualine_z = {'os.date("%I:%M%p")'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    --lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {
        'tabs'
        --{
          --'tabs',
          --tab_max_length = 40,  -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
          --max_length = vim.o.columns, -- Maximum width of tabs component.
                                          ---- Note:
                                          ---- It can also be a function that returns
                                          ---- the value of `max_length` dynamically.
          --mode = 1, -- 0: Shows tab_nr
                    ---- 1: Shows tab_name
                    ---- 2: Shows tab_nr + tab_name

          --path = 1, -- 0: just shows the filename
                    ---- 1: shows the relative path and shorten $HOME to ~
                    ---- 2: shows the full path
                    ---- 3: shows the full path and shorten $HOME to ~

          ---- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
          --use_mode_colors = true,

          --tabs_color = {
            --active = 'lualine_a_normal',
            --inactive = 'lualine_a_inactive',
          --},
          --fmt = function(name, context)
            ---- Get actual tabpage handle from index
            --local tabpages = vim.api.nvim_list_tabpages()
            --local tabpage = tabpages[context.tabnr]

            ---- Safeguard
            --if not tabpage then return name end

            --local winnr = vim.api.nvim_tabpage_get_win(tabpage)
            --local bufnr = vim.api.nvim_win_get_buf(winnr)
            --local bufname = vim.api.nvim_buf_get_name(bufnr)
            --local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')
            --local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')



            ---- Handle special buffers
            --if filetype == 'fugitive' then
              --return ' ' .. name  -- git icon
            --elseif buftype == 'terminal' then
              --return ' ' .. name  -- terminal icon
            --elseif buftype == 'help' then
              --return ' ' .. name  -- help icon
            --elseif buftype ~= '' and bufname == '' then
              --return ' ' .. name  -- default icon
            --end

            ---- Regular file
            --local filename = vim.fn.fnamemodify(bufname, ':t')
            --local extension = vim.fn.fnamemodify(bufname, ':e')
            --local icon = devicons.get_icon(filename, extension, { default = true })

            --return icon .. ' ' .. name
          --end,

          --show_modified_status = true,  -- Shows a symbol next to the tab name if the file has been modified.
          --symbols = {
            --modified = '[●]',  -- Text to show when the file is modified.
          --},
        --}
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

local shell = (vim.loop.os_uname().sysname == "Windows_NT") and "cmd.exe" or "/bin/bash"
require('fzf-lua').setup({
  shell = shell,
  defaults = {
    --git_icons = false,
    --file_icons = false,
    --color_icons = false,
  },
  winopts = {
      -- split = "belowright new",-- open in a split instead?
              -- "belowright new"  : split below
              -- "aboveleft new"   : split above
              -- "belowright vnew" : split right
              -- "aboveleft vnew   : split left
      -- Only valid when using a float window
      -- (i.e. when 'split' is not defined, default)
      height           = 0.85,            -- window height
      width            = 0.80,            -- window width
      row              = 0.35,            -- window row position (0=top, 1=bottom)
      col              = 0.50,            -- window col position (0=left, 1=right)
      -- border argument passthrough to nvim_open_win(), also used
      -- 'none', 'single', 'double', 'thicc' (+cc) or 'rounded' (default)
      border           = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
      backdrop         = 60,
      -- title         = "Title",
      -- title_pos     = "center",    -- 'left', 'center' or 'right'
      fullscreen       = false,           -- start fullscreen?
      -- enable treesitter highlighting for the main fzf window will only have
      -- effect where grep like results are present, i.e. "file:line:col:text"
      -- due to highlight color collisions will also override `fzf_colors`
      -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
      treesitter       = {
        enabled    = true,
        fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
      },
      preview = {
        --default        = 'bat',           -- override the default previewer?
                                          -- default uses the 'builtin' previewer
        border         = 'border',        -- border|noborder, applies only to
                                          -- native fzf previewers (bat/cat/git/etc)
        wrap           = 'nowrap',        -- wrap|nowrap
        hidden         = 'nohidden',      -- hidden|nohidden
        vertical       = 'down:45%',      -- up|down:size
        horizontal     = 'right:60%',     -- right|left:size
        layout         = 'flex',          -- horizontal|vertical|flex
        flip_columns   = 100,             -- #cols to switch to horizontal on flex
        -- Only used with the builtin previewer:
        title          = true,            -- preview border title (file/buf)?
        title_pos      = "center",        -- left|center|right, title alignment
        scrollbar      = 'float',         -- `false` or string:'float|border'
                                          -- float:  in-window floating border
                                          -- border: in-border "block" marker
        scrolloff      = '-2',            -- float scrollbar offset from right
                                          -- applies only when scrollbar = 'float'
        delay          = 20,              -- delay(ms) displaying the preview
                                          -- prevents lag on fast scrolling
        winopts = {                       -- builtin previewer window options
          number            = true,
          relativenumber    = false,
          cursorline        = true,
          cursorlineopt     = 'both',
          cursorcolumn      = false,
          signcolumn        = 'no',
          list              = false,
          foldenable        = false,
          foldmethod        = 'manual',
        },
      },
      on_create = function()
        -- called once upon creation of the fzf main window
        -- can be used to add custom fzf-lua mappings, e.g:
        --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
      end,
      -- called once _after_ the fzf interface is closed
      -- on_close = function() ... end
  }
})

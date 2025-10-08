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
    --vim.api.nvim_set_hl(0, "EndOfBuffer", {})
    --vim.api.nvim_set_hl(0, "StatusColumn", {})
end

vim.keymap.set('n', '<leader>tr', set_transparent)
vim.keymap.set('n', '<leader>tR',
    function()
        colorscheme = vim.api.nvim_exec('colorscheme', { output = true })
        vim.api.nvim_exec('colorscheme ' .. colorscheme, {})
    end
)

-- Always show the tabline
vim.o.showtabline = 2

-- Custom tabline with clickable tabs
function _G.MyTabLine()
  local s = ""
  local tabpages = vim.api.nvim_list_tabpages()
  local current = vim.api.nvim_get_current_tabpage()

  for i, t in ipairs(tabpages) do
    if t == current then
      s = s .. "%#TabLineSel#"
    else
      s = s .. "%#TabLine#"
    end

    local win = vim.api.nvim_tabpage_get_win(t)
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
    if name == "" then name = "[No Name]" end

    -- Make this section clickable: %iT
    s = s .. "%" .. i .. "T " .. i .. ":" .. name .. " "
  end

  -- Reset click target
  s = s .. "%T"

  -- Fill rest of line
  s = s .. "%#TabLineFill#%=%#TabLine#"

  -- Add clock at far right
  s = s .. os.date("%I:%M %p")

  return s
end

-- Tell Neovim to use our function
vim.o.tabline = "%!v:lua.MyTabLine()"

-- Refresh tabline every minute so the clock updates
vim.fn.timer_start(60000, function()
  vim.cmd("redrawtabline")
end, { ["repeat"] = -1 })


-- init.lua or lua/plugins/encoding.lua

-- 1. Statusline with encoding + fileformat
-- If you use lualine, see the note below
vim.o.statusline = table.concat({
  "%f",                            -- filename
  "%h%m%r",                        -- help, modified, readonly flags
  "%=",                            -- right align
  "%-14.(%l,%c%V%) %P",            -- line/col/percent
  " [%{&fileencoding}][%{&fileformat}]" -- encoding + fileformat
})

-- 2. Telescope picker for file encodings
local ok, telescope = pcall(require, "telescope")
if ok then
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values

  local encodings = { "utf-8", "latin1", "cp1252", "utf-16", "ucs-bom" }

  local function select_encoding()
    pickers.new({}, {
      prompt_title = "Select Encoding",
      finder = finders.new_table(encodings),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(_, map)
        map("i", "<CR>", function(bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(bufnr)
          vim.cmd("set fileencoding=" .. selection[1])
          vim.notify("Encoding set to " .. selection[1])
        end)
        map("n", "<CR>", function(bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(bufnr)
          vim.cmd("set fileencoding=" .. selection[1])
          vim.notify("Encoding set to " .. selection[1])
        end)
        return true
      end,
    }):find()
  end

  vim.keymap.set("n", "<leader>fe", select_encoding, { desc = "Select file encoding" })
end

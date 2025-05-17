local regfile = vim.fn.stdpath("data") .. "/registers.vim"

-- Save registers on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local file = io.open(regfile, "w")
    if not file then return end

    local function save_register(name)
      local ok, reg = pcall(vim.fn.getreg, name)
      local oktype, type = pcall(vim.fn.getregtype, name)
      if ok and reg ~= '' then
        -- Escape backslashes and quotes
        reg = reg:gsub("\\", "\\\\"):gsub('"', '\\"')
        type = type or ""
        file:write(string.format('call setreg("%s", "%s", "%s")\n', name, reg, type))
      end
    end

    -- Save useful registers
    for _, r in ipairs {
      '"', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
    } do
      save_register(r)
    end

    file:close()
  end
})

-- Load registers on startup
local reg_restore = io.open(regfile, "r")
if reg_restore then
  vim.cmd("silent! source " .. regfile)
  reg_restore:close()
end

vim.keymap.set('n', '--', ':Explore<Enter>', { silent = true })
vim.keymap.set('n', '-v', ':Vexplore<Enter>', { silent = true })
vim.keymap.set('n', '-s', ':Sexplore<Enter>', { silent = true })
vim.keymap.set('n', '-t', ':Texplore<Enter>', { silent = true })
vim.keymap.set('n', '<leader>o', ':Texplore .<Enter>', { silent = true })

-- git stuff
vim.keymap.set('n', '<leader>g', ':tab G<Enter>', { silent = true })
vim.keymap.set('n', '<leader>l', ':let @l=line(".")<Enter>:vertical G log --patch -L<C-R>l,+1:%<Enter>')
vim.keymap.set('v', '<leader>l', ':<C-w>let @l=line("\'<")<Enter>:let @m=line("\'>")<Enter>:vertical G log --patch -L<C-R>l,<C-R>m:%<Enter>')

vim.keymap.set('n', '<C-s>', ':b #<Enter>', { silent = true })

vim.keymap.set('n', '<leader>fp', ':let @" = expand("%")<Enter>', { silent = true })

-- Determine what shell to use in terminal splits
local function get_terminal_command()
  if vim.fn.has('win32') == 1 then
    -- Check if powershell is available
    if vim.fn.executable('powershell') == 1 then
      return 'powershell'
    end
  end
  return '' -- use default shell
end

local term_cmd = get_terminal_command()
local function terminal_command()
  if term_cmd ~= '' then
    return ':terminal ' .. term_cmd .. '<CR>:set nonumber<CR>:set norelativenumber<CR>a'
  else
    return ':terminal<CR>:set nonumber<CR>:set norelativenumber<CR>a'
  end
end

-- Terminal keybindings (same across all OSes)
vim.keymap.set('n', '<leader><leader>t', ':tabe<CR>' .. terminal_command(), { silent = true })
vim.keymap.set('n', '<leader><leader>-t', ':-tabe<CR>' .. terminal_command(), { silent = true })
vim.keymap.set('n', '<leader><leader>v', ':vsplit<CR>' .. terminal_command(), { silent = true })
vim.keymap.set('n', '<leader><leader>s', ':split<CR>' .. terminal_command(), { silent = true })
vim.keymap.set('t', '<Esc><leader>', '<C-\\><C-n>', { silent = true })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "<A-w>", ":tabc<Enter>", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

vim.keymap.set('n', '<C-Up>', ':cprev<Enter>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':cnext<Enter>', { silent = true })

vim.keymap.set('n', '<C-Left>', ':tabmove - <Enter>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':tabmove + <Enter>', { silent = true })

vim.keymap.set('n', '<C-b>', ':set scrollbind<Enter>', { silent = true })
vim.keymap.set('n', '<C-n>', ':set noscrollbind<Enter>', { silent = true })

vim.keymap.set('n', '<leader>x', [[:@@<CR>]], { desc = 'Repeat last Ex command' })

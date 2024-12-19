-- Example keybind
-- "n" is for Normal mode
-- "ss" is the key presses needed for the action
-- ":split<CR><C-w>w" is the command it runs
-- vim.keymap.set("n", "ss", ":vsplt")

-- I can't find what <CR> is but it seems to autorun at least some : commands
-- Update: <CR> means Open according to NvimTree

-- Split screen and move between them
vim.keymap.set("n", "ss", ":vsplit<CR><C-w>w") -- Open a horizontal split.
vim.keymap.set("n", "sh", "<C-w>h") -- Navigate to the split window on the immediate left.
vim.keymap.set("n", "sl", "<C-w>l") -- Navigate to the split window on the immediate right.

-- Nvim Tree Keybinds

vim.keymap.set("n", "tt", ":NvimTreeFocus<CR>") -- Open NvimTree

-- ToggleTerm

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 5, direction='float' })
local quickterm = Terminal:new({ hidden = true, count = 4, direction='float' })

function _lazygit_toggle()
  lazygit:toggle()
end

function _terminal_toggle()
  quickterm:toggle()
end

vim.keymap.set("n", "tm", ":ToggleTerm<CR>") -- Toggle the Terminal
vim.keymap.set('t', '<F12>', [[<C-\><C-n>]], opts) -- Exit terminal mode

  -- Toggle basic terminal

vim.keymap.set("n", "<F4>", "<cmd>lua _terminal_toggle()<CR>", {noremap = true; silent = true;})
vim.keymap.set("t", "<F4>", "<cmd>lua _terminal_toggle()<CR>", {noremap = true; silent = true;})

  -- Toggle Lazygit

vim.keymap.set("n", "<F2>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true; silent = true;})
vim.keymap.set("t", "<F2>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true; silent = true;})

-- Speed up some common actions I be doin

vim.keymap.set("n", "<F5>", ":w<CR>") -- Save file
vim.keymap.set("n", "<F6>", ":q<CR>") -- Close file
vim.keymap.set("n", "<F8>", ":qa<CR>") -- Close all


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

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "tm", ":ToggleTerm<CR>") -- Toggle the Terminal
vim.keymap.set("n", "tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true; silent = true;}) -- Toggle the Terminal
vim.keymap.set('t', '<F3>', [[<C-\><C-n>]], opts) -- Exit terminal mode

-- Speed up some common actions I be doin
vim.keymap.set("n", "<F1>", ":") -- Save and quit all

vim.keymap.set("n", "<F5>", ":buftype=<CR>") -- Save and quit all
vim.keymap.set("n", "<F5>", ":wqa<CR>") -- Save and quit all


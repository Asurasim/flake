-- System Clipboard (Wayland & X11?)
vim.opt.clipboard = "unnamedplus"

-- Display Numbers
vim.wo.number = true

require("plugstuff")

-- NVIM TREE
	-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

	-- default settings
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

	-- Open on startup
if vim.fn.argc(-1) == 0 then
	vim.cmd("NvimTreeOpen")
end

-- VIM WIKI
vim.cmd("let g:vimwiki_list = [{'path': '~/Notes/'}]")

-- TOGGLETERM
require("toggleterm").setup()

-- Load Other Files
require("keybinds")

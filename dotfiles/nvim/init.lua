-- System Clipboard (Wayland & X11?)
vim.opt.clipboard = "unnamedplus"

-- Display Numbers
vim.wo.number = true


-- VIM PLUG
-- local Plug = vim.fn['plug#']
-- vim.call('plug#begin', '~/.config/nvim/plugged')
-- 	Plug 'vimwiki/vimwiki'
--	Plug 'nvim-tree/nvim-tree.lua'
--	Plug 'akinsho/toggleterm.nvim'
-- vim.call('plug#end')


-- NVIM TREE
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
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

-- VIM WIKI
vim.cmd("let g:vimwiki_list = [{'path': '~/Notes/'}]")

-- TOGGLETERM
require("toggleterm").setup()

-- Load Other Files
require("keybinds")

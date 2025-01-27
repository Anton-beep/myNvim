-- config files
require("config.lazy")
require("config.colorscheme")
require("config.mason")

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 40,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

-- autocomplete
vim.g.coq_settings = {
	keymap = { jump_to_mark = "<c-\\" },
}

-- lsp
local lspconfig = require('lspconfig')

-- mappings
require("mappings")

-- other
vim.wo.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.background = "light"

require("config.lazy")

require("mason").setup()
require("mason-lspconfig").setup()

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

vim.g.coq_settings = {
    keymap =  { jump_to_mark = "<c-\\" },
}

vim.cmd("colorscheme catppuccin-latte")

local lspconfig = require('lspconfig')

lspconfig.golangci_lint_ls.setup{}

require("mappings")

vim.wo.relativenumber = true

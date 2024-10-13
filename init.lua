vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

require("mason").setup()


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

require("mappings")

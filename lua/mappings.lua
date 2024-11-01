-- lua/mappings.lua

-- Shorten function name for convenience
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, }  -- Common options

-- Normal mode mappings
map("n", "<C-s>", ":w<CR>", opts)  -- Save file
map("n", "<C-h>", "<C-w>h", opts)  -- Move left between splits
map("n", "<C-l>", "<C-w>l", opts)  -- Move right between splits
map("n", "<C-j>", "<C-w>j", opts)  -- Move down between splits
map("n", "<C-k>", "<C-w>k", opts)  -- Move up between splits

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = false, silent = true })

-- Insert mode mappings
map("i", "jk", "<ESC>", opts)  -- Fast exit from insert mode

-- Visual mode mappings
map("v", "<", "<gv", opts)  -- Stay in visual mode when indenting
map("v", ">", ">gv", opts)




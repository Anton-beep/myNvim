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
vim.keymap.set('n', '<leader>lf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>lb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>lh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = false, silent = true })

-- Insert mode mappings
map("i", "jk", "<ESC>", opts)  -- Fast exit from insert mode

-- Visual mode mappings
map("v", "<", "<gv", opts)  -- Stay in visual mode when indenting
map("v", ">", ">gv", opts)

-- map("n", "<leader>bt", ":set bg=light", opts)

-- Toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal horizontal split" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<CR>", { desc = "Terminal vertical split" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })

-- Define the on_attach function to map LSP-related keys
local on_attach = function(_, bufnr)
  -- Key mappings, which apply only when an LSP server is attached to the buffer
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition", unpack(bufopts) })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to Declaration", unpack(bufopts) })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation", unpack(bufopts) })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = "Go to Type Definition", unpack(bufopts) })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation", unpack(bufopts) })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature Help", unpack(bufopts) })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename Symbol", unpack(bufopts) })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action", unpack(bufopts) })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "List References", unpack(bufopts) })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show Line Diagnostics", unpack(bufopts) })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic", unpack(bufopts) })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic", unpack(bufopts) })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Show Diagnostics List", unpack(bufopts) })
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { desc = "Format Buffer", unpack(bufopts) })
end

-- Auto-setup all available servers using Mason's setup_handlers
require('mason-lspconfig').setup_handlers({
    -- Default setup for all servers
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = on_attach,
        }
    end,
})

-- barbar
vim.keymap.set("n", "<leader>bn", ":BufferNext<CR>", { desc = "Buffer Next" , noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":BufferPrevious<CR>", { desc = "Buffer Next" , noremap = true, silent = true })

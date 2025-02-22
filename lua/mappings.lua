-- lua/mappings.lua

-- Shorten function name for convenience
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, } -- Common options

-- Normal mode mappings
map("n", "<C-s>", ":w<CR>", opts) -- Save file
map("n", "<C-h>", "<C-w>h", opts) -- Move left between splits
map("n", "<C-l>", "<C-w>l", opts) -- Move right between splits
map("n", "<C-j>", "<C-w>j", opts) -- Move down between splits
map("n", "<C-k>", "<C-w>k", opts) -- Move up between splits

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Tree
map("n", "<leader>et", ":NvimTreeToggle<CR>", { noremap = false, silent = true })
map("n", "<leader>er", ":NvimTreeRefresh<CR>", { noremap = false, silent = true })

-- Insert mode mappings
map("i", "jk", "<ESC>", opts) -- Fast exit from insert mode

-- Visual mode mappings
map("v", "<", "<gv", opts) -- Stay in visual mode when indenting
map("v", ">", ">gv", opts)

-- map("n", "<leader>bt", ":set bg=light", opts)

-- Toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal horizontal split" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<CR>", { desc = "Terminal vertical split" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })
map("n", "<leader>tt", ":tab term<CR>", { desc = "Open terminal in a new tab" })

-- Define the on_attach function to map LSP-related keys
local on_attach = function(_, bufnr)
	-- Key mappings, which apply only when an LSP server is attached to the buffer
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, { desc = "Go to Definition", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration, { desc = "Go to Declaration", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, { desc = "Go to Implementation", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lgt', vim.lsp.buf.type_definition, { desc = "Go to Type Definition", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lK', vim.lsp.buf.hover, { desc = "Hover Documentation", unpack(bufopts) })
	vim.keymap.set('n', '<leader>l<C-k>', vim.lsp.buf.signature_help, { desc = "Signature Help", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename Symbol", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, { desc = "Code Action", unpack(bufopts) })
	vim.keymap.set('n', '<leader>li', vim.lsp.buf.references, { desc = "List References", unpack(bufopts) })
	vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = "Show Line Diagnostics", unpack(bufopts) })
	vim.keymap.set('n', '<leader>l[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic", unpack(bufopts) })
	vim.keymap.set('n', '<leader>l]d', vim.diagnostic.goto_next, { desc = "Next Diagnostic", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = "Show Diagnostics List", unpack(bufopts) })
	vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end,
		{ desc = "Format Buffer", unpack(bufopts) })
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
vim.keymap.set("n", "<leader>bn", ":BufferNext<CR>", { desc = "Buffer Next", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":BufferPrevious<CR>", { desc = "Buffer Next", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", ":BufferClose<CR>", { desc = "Buffer Next", noremap = true, silent = true })

-- splitting windows
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true }) -- Vertical split
vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })  -- Horizontal split

-- copy paste
vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })

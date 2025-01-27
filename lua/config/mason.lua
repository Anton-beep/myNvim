require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"lua_ls", "harper_ls", "golangci_lint_ls", "yamlls", "dockerls"
	}
}



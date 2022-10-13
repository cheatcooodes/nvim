-- https://github.com/williamboman/mason.nvim
require("mason").setup({
	ui = {
		border = "",
		icons = {
			package_installed = "✓",
			package_uninstalled = "✗",
			package_pending = "➜"
		}
	}
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"pyright",
		"clangd",
		"bash-language-server"
	},
	automatic_installation = true
})

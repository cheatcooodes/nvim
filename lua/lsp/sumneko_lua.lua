-- Setup
require('lspconfig')['sumneko_lua'].setup({
	settings = {
		Lua = {
			-- Get the language server to recognize the 'vim' global
			diagnostics = { globals = {'vim'} }
		},
		workspace = {
			library = {
				[vim.fn.expand "$VIMRUNTIME/lua"] = true,
				[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
			},
			maxPreload = 100000,
			preloadFileSize = 10000,
		},
	}
})

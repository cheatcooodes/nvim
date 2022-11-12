local map = vim.keymap.set
local lspconfig = require('lspconfig')

-- Only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
	-- See `:help vim.diagnostic.*` and `:help vim.lsp.*`
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

	-- Show diagnostics in a floating window
	map('n', 'gl', vim.diagnostic.open_float, bufopts)

	-- Move to the previous diagnostic
	map('n', '[d', vim.diagnostic.goto_prev, bufopts)

	-- Move to the next diagnostic
	map('n', ']d', vim.diagnostic.goto_next, bufopts)

	-- Displays hover information about the symbol under the cursor
  map('n', 'K', vim.lsp.buf.hover, bufopts)

	-- Jump to the definition
  map('n', 'gd', vim.lsp.buf.definition, bufopts)

	-- Jump to declaration
	map('n', 'gD', vim.lsp.buf.declaration, bufopts)

	-- Lists all the implementation for the symbol under the cursor
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)

	-- Displays a function's signature information
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

	-- Lists all the references
	map('n', 'gr', vim.lsp.buf.references, bufopts)

	-- Jump to the definition of the type symbol
	map('n', 'go', vim.lsp.buf.type_definition, bufopts)

	-- Renames all references to the symbol under the cursor
	map('n', '<F2>', vim.lsp.buf.rename, bufopts)

	-- Selects a code action available at the current cursor position
	map('n', '<F4>', vim.lsp.buf.code_action, bufopts)
	-- map('x', '<F4>', vim.lsp.buf.range_code_action, bufopts)

	-- Formatting
	-- map('n', '==', function() vim.lsp.buf.format({ async = true }) end, bufopts)
	-- map('n','=', function() vim.lsp.buf.range_formatting({ async = true }) end, bufopts)
end

-- Global config
local lsp_defaults ={
	on_attach = on_attach, -- on_attach funtion
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require('cmp_nvim_lsp').default_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	),
}

-- Merge default lspconfig with user's lspconfig
lspconfig.util.default_config = vim.tbl_deep_extend(
	'force',
	lspconfig.util.default_config,
	lsp_defaults
)



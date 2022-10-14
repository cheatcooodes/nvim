local installedPackages = require('mason-registry').get_installed_package_names()

for _,lsp in pairs(installedPackages) do
	if lsp == 'lua-language-server' then lsp = 'sumneko_lua' end
	if lsp == 'bash-language-server' then lsp = 'bashls' end
	require('lspconfig')[lsp].setup({})
end


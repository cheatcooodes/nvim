--[[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

 cheatcooodes's Neovim config

 6/Oct/2022
--]]

local config = {
	-- CORE
	"core.options",
	"core.mappings",
	"core.colorscheme",
	"core.autocmds",
	"core.plugins",

	-- PLUGINS
	"plugins.lualine",
	"plugins.autopairs",
	"plugins.hop",
	"plugins.mason",
	"plugins.lspconfig",
	"plugins.lspkind",
	"plugins.cmp",
	"plugins.luasnip",
	"plugins.treesitter",

	-- LSP
	"lsp.pyright",
	"lsp.sumneko_lua",
	"lsp.clangd",
}

for _,luafile in pairs(config) do
	local status_ok = pcall(require,luafile)
	if not status_ok then
		vim.notify("Failed to load "..luafile)
	end
end

--[[
if vim.g.vscode then
end

if vim.fn.has("wsl") then 
end
--]]

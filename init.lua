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

	-- PLUGINS
	"plugins",
	"plugins.configs.lualine",
	"plugins.configs.autopairs",
	"plugins.configs.hop",
	"plugins.configs.mason",
	"plugins.configs.lspconfig",
	"plugins.configs.lspkind",
	"plugins.configs.cmp",

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
	-- vscode-neovim stuff
end

if vim.fn.has("wsl") then 
	-- Do nothing
end
--]]

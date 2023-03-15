
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

-- cheatcooodes's Neovim config

-- Oct 6th 2022

local configs = {
	-- CORE
	"core.options",
	"core.keymaps",
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
	"plugins.vim-markdown",
	"plugins.treesitter",
	"plugins.dap",
	-- "plugins.transparent",

	-- LSP
	"lsp.pyright",
	"lsp.sumneko_lua",
	"lsp.clangd",
	"lsp.tsserver"
}

for _,luafile in pairs(configs) do
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

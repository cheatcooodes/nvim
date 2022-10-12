--[[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

──── cheatcooodes's Neovim config  6/Oct/2022 ────

--]]

local config = {
	-- [CORE]
	"core.options",
	"core.utils",
	"core.mappings",
	"core.colorscheme",
	"core.autocmds",

	-- [PLUGINS]
	"plugins",
	"plugins.configs.autopairs",
	"plugins.configs.hop"
}

if vim.g.vscode then
	-- vscode-neovim stuff
end

if vim.fn.has("wsl") then 
	-- Do nothing
end

for i,luafile in pairs(config) do
	local status_ok = pcall(require,luafile)
	if not status_ok then
		vim.notify("Failed to load "..luafile)
	end
end


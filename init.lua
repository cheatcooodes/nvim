--[[

 _   _                 _
| \ | | ___  _____   _(_)_ __ ___
|  \| |/ _ \/ _ \ \ / / | '_ ` _ \
| |\  |  __/ (_) \ V /| | | | | | |
|_| \_|\___|\___/ \_/ |_|_| |_| |_|

	cheatcooodes's Neovim config


--]]

local normal_config = {
	-- [CORE]
	"core.options",
	"core.mappings",
	"core.colorscheme",
	"core.autocmds",
	"core.packer",
	-- [PLUGINS]
	-- "plugins.stuff",
}

local vscode_config = {
	"core.options",
	"core.mappings",
}

local config = normal_config
if vim.g.vscode then
	config = vscode_config
end
for i,luafile in pairs(config) do
	local status_ok = pcall(require,luafile)
	if not status_ok then
		vim.notify("Failed to load "..luafile)
	end
end

-- if vim.fn.has("wsl") then end


-- 6/Oct/2022
-- https://github.com/xxCheatCodes/nvim

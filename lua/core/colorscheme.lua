local colorscheme = "onedark"
vim.o.background = "dark"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	-- vim.notify("[colorscheme.lua]: \"" .. colorscheme .. "\" 没有找到！")
	return
end

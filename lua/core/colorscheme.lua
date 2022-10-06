local colorscheme
local background = vim.o.background

colorscheme = "onedark"
background = "dark"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. "没有找到！")
	return
end



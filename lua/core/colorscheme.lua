vim.o.background = "dark" -- light | dark

local colorscheme = "bluloco"
-- onedark
-- ayu
-- bluloco
-- nord
-- etc

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("[colorscheme.lua]: \"" .. colorscheme .. "\" not found!")
	return
end




local colorscheme = "onedark" -- "nord"
vim.o.background = "dark"

-- vim.g.github_colors_soft = 1
-- vim.g.airline_theme = "github"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	-- vim.notify("[colorscheme.lua]: \"" .. colorscheme .. "\" 没有找到！")
	return
end


local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})
local autocmd = vim.api.nvim_create_autocmd

-- Auto save
autocmd({"InsertLeave", "TextChanged"}, {
		group = myAutoGroup,
		command = "silent wall", -- write all without notify
	})


-- Update the config without restarting
autocmd({"InsertLeave", "TextChanged"}, {
	group = myAutoGroup,
	pattern = {"*/.config/nvim/*.lua","*/.config/nvim/*.vim"},
	callback = function()
		local status_ok = pcall(vim.cmd,"source %")
		if status_ok then
			vim.notify("Configuration updated")
		else
			vim.notify("")
		end
	end
})

-- Terminal Mode
-- Automatically enter insert mode
autocmd("TermOpen", {
	group = myAutoGroup,
	command = "startinsert",
})

-- Line number will not be displayed
autocmd("TermOpen", {
	group = myAutoGroup,
	callback = function()
		vim.wo.number = false -- "wo" means options in current window
		vim.wo.relativenumber = false
	end
})





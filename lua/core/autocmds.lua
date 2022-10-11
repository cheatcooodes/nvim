local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})
local autocmd = vim.api.nvim_create_autocmd

-- Auto save
autocmd({"InsertLeave", "TextChanged"}, {
		group = myAutoGroup,
		command = "silent! wall", -- write all without notify
	})


-- Update the config without restarting
autocmd({"InsertLeave", "TextChanged"}, {
	group = myAutoGroup,
	pattern = {"*/.config/nvim/*.lua","*/.config/nvim/*.vim"},
	callback = function()
		local status_ok = pcall(vim.cmd,"source %")
		if status_ok then
			current_file = vim.fn.expand("%:t")
			if string.match(vim.fn.expand("%:p"),".*/.config/nvim/lua/plugins/.*%plua") then 
				-- I hate the pattern matching in lua
				pcall(vim.cmd,"PackerCompile")
			end
			vim.notify("["..current_file.."]: ".."Configuration updated.")
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





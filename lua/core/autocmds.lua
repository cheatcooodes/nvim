local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})
local autocmd = vim.api.nvim_create_autocmd

-- Auto save
autocmd({"InsertLeave", "TextChanged"}, {
		group = myAutoGroup,
		command = "silent wall", -- write all without notify
	})

-- Source the bashrc/zshrc when leaving the current buffer
autocmd("BufWinLeave", { -- "BufWritePost"
	group = myAutoGroup,
	pattern = {".bashrc",".zshrc"},
	command = "!source %",
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

-- Clipboard Config for WSL
-- Not having the if judgment here can cause problems.
-- vim.fn.system doesn't work here.
if vim.fn.has("wsl") then
	autocmd("TextYankPost *", {
		group = myAutoGroup,
		callback = function()
			vim.cmd([[
			if v:event.regname ==# '+'
				call system('/mnt/c/windows/system32/clip.exe ',@")
			endif ]]) 
			-- vim.notify("The content has been yanked to clip.exe")
		end
	})
end






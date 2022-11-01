local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command



 --- Create Autocommands Groups ---
vim.api.nvim_create_augroup("updateConfig", { clear = true })
vim.api.nvim_create_augroup("autoWriteAll", { clear = true })
vim.api.nvim_create_augroup("terminal", { clear = true })



 --- Auto Commands ---

-- auto write all
autocmd({"InsertLeave", "TextChanged"}, {
	group = "autoWriteAll",
	command = "silent! wall",
})

-- Update the config without restarting
autocmd({"InsertLeave", "TextChanged"}, {
	group = "updateConfig",
	pattern = {"*/.config/nvim/*.lua","*/.config/nvim/*.vim"},
	callback = function()
		local status_ok = pcall(vim.cmd,"source %")
		if status_ok then
			local current_file = vim.fn.expand("%:t")
			if string.match(vim.fn.expand("%:p"),".*/.config/nvim/lua/plugins/.*%plua") then
				-- I hate the pattern matching in lua
				pcall(vim.cmd,"PackerCompile")
			end
			vim.notify("["..current_file.."] ".."Configuration updated.")
		else
			vim.notify("")
		end
	end
})

-- Terminal Mode
-- Automatically switch to insert mode
autocmd("TermOpen", {
	group = "terminal",
	command = "startinsert",
})

-- Line number will not be displayed
autocmd("TermOpen", {
	group = "terminal",
	callback = function()
		vim.wo.number = false -- "wo" means options in current window
		vim.wo.relativenumber = false
	end
})

-- Highlight when yanking
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 300
		})
	end
})

-- Allow wrapping when editting text files
autocmd("BufEnter", {
	pattern = {"*.md","*.tex","*.txt"},
	command = "set wrap"
})



 --- User Defined Commands ---

usercmd(
	'Run',
	function()
		local supportedFileTypes = {"python","cpp","c","sh",}

		local filetype = vim.opt.filetype:get()
		-- vim.notify("filetype: " .. filetype)
		for _,v in pairs(supportedFileTypes) do
			if filetype == v then
				vim.cmd("silent! w |silent! !chmod 755 %")
				if filetype == 'python' then
					vim.cmd("!python3 %")
				elseif filetype == 'c' then
					-- vim.cmd("!gcc % && ./a.out") -- Or "vim.cmd([[vsplit |terminal gcc % && ./a.out]])"
					vim.cmd([[vsplit |terminal gcc % -lm && ./a.out]])
				elseif filetype == 'cpp' then
					vim.cmd("!g++ % && ./a.out")
				elseif filetype == 'sh' then
					vim.cmd("!./%") end
				return
			end
		end
		vim.notify("[CodeRunner]: The file type \""..filetype.."\" isn't supported.")
	end,
	{bang = true}
)


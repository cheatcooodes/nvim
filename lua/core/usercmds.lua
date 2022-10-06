local usercmd = vim.api.nvim_create_user_command


function code_runner()
	local supportedFileTypes = {
		"python",
		"cpp",
		"c",
		"sh",
	}

	local filetype = vim.opt.filetype:get()
	-- vim.notify("filetype: " .. filetype)
	for _,v in pairs(supportedFileTypes) do
		if filetype == v then
			vim.cmd("silent! w |silent! !chmod 755 %")
			if filetype == 'python' then
				vim.cmd("!python3 %")
			elseif filetype == 'c' then
				vim.cmd("!gcc % && ./a.out") -- Or "vim.cmd([[vsplit |terminal gcc % && ./a.out]])"
			elseif filetype == 'cpp' then
				vim.cmd("!g++ % && ./a.out")
			elseif filetype == 'sh' then
				vim.cmd("!./%") end
			return
		end
	end

	vim.notify("CodeRunner: The file type "..filetype.." is not supported.")
	return

end

-- Compile and execute the current file
usercmd(
	'Run',
	code_runner,
	{bang = true}
)


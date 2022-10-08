local map = vim.keymap.set
local utils_exist,utils = pcall(require,"core.utils")

-- Deprecated
-- local map = vim.api.nvim_set_keymap
-- local opt = { noremap = true, silent = true }


-- [CORE]
-- Leader key
vim.g.mapleader = " " -- 不能用<space>

-- 取消高亮
map("n", "<ESC>", ":noh<CR>")
-- 屏幕行之间跳转
map("n", "j", "gj")
map("n", "k", "gk")
-- 移动到行首/行尾 (屏幕行)
map("n", "H", "g^")
map("n", "L", "g$")
map("v", "H", "g^")
map("v", "L", "g$")
-- 光标处输入回车符（覆盖原本的帮助功能）
map("n", "K", "a<CR><ESC>^")
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Quit terminal mode
map("t", "<ESC><ESC>", "<C-\\><C-n>")
map("t", "<C-w>h", "<C-\\><C-n><C-w>h")
map("t", "<C-w>j", "<C-\\><C-n><C-w>j")
map("t", "<C-w>k", "<C-\\><C-n><C-w>k")
map("t", "<C-w>l", "<C-\\><C-n><C-w>l")
-- Toggle relative line number
map("","<leader>r", 
	function()
		local status = vim.opt.relativenumber:get()
		if status == true then
			vim.opt.relativenumber = false
		else
			vim.opt.relativenumber = true
		end
	end,{desc="Toggle relative line number"})
-- Open a terminal
map("","<Nop>",
	function() 
		vim.cmd([[vsplit|terminal]])
		vim.cmd([[startinsert]])
		vim.opt.number = false
		vim.opt.relativenumber = false
	end)


-- [UTILS]
if utils_exist then

-- CodeRunner
	map("n","<F5>",
		function()
			utils.code_runner()
		end)

end


-- [PLUGINS]
-- hop.nvim
if pcall(require,"hop") then
	map('','<leader><leader>',"<cmd>HopWord<CR>")
	-- map('','/',"<cmd>HopPattern<CR>")
end



-- 屏蔽不常用的按键
-- R,r,T,t

-- 切换标签
-- <C-Tab>

-- focus on explorer
-- <C-e>


-- vim-surround
-- <leader>s

-- easy-motion
-- <leader>f

-- telescope
-- <leader>F

-- toggle explorer
-- <leader>e

-- Markdown mode
-- 只在.md文件中生效
-- <leader>m
-- <leader>mb **Bold**
-- <leader>mi *Italic*
-- <leader>md ~~delete~~
-- <leader>mm $math$
-- <leader>mp preview markdown
-- <leader>m1 # h1
-- <leader>m2 ## h2
-- <leader>m3 ### h3
-- <leader>m4 #### h4
-- <leader>m5 ##### h5
-- <leader>m6 ###### h6

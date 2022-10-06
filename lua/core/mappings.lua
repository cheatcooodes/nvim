-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " " -- 不能用<space>

-- 取消高亮
map("n", "<ESC>", ":noh<CR>", opt)
-- 屏幕行之间跳转
map("n", "j", "gj", opt)
map("n", "k", "gk", opt)
-- 移动到行首/行尾 (屏幕行)
map("n", "H", "g^", opt)
map("n", "L", "g$", opt)
map("v", "H", "g^", opt)
map("v", "L", "g$", opt)
-- 拖拽选中行（来自LunarVim配置）
-- 对vscode支持较差
-- map("v","J",":move '>+1<CR>gv-gv",opt)
-- map("v","K",":move '<lt>-2<CR>gv-gv",opt)
-- 光标处输入回车符（覆盖原本的帮助功能）
map("n", "K", "a<CR><ESC>^", opt)
-- Stay in indent mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- Quit terminal mode
map("t", "<ESC><ESC>", "<C-\\><C-n>", opt)
map("t", "<C-w>h", "<C-\\><C-n><C-w>h", opt)
map("t", "<C-w>j", "<C-\\><C-n><C-w>j", opt)
map("t", "<C-w>k", "<C-\\><C-n><C-w>k", opt)
map("t", "<C-w>l", "<C-\\><C-n><C-w>l", opt)

-- 切换相对行号
vim.keymap.set("","<leader>r", 
	function()
		local status = vim.opt.relativenumber:get()
		if status == true then
			vim.opt.relativenumber = false
		else
			vim.opt.relativenumber = true
		end
	end,
opt)

vim.keymap.set("n","<F5>",
	function()
		local code_runner = code_runner()
		pcall(code_runner)
	end,
opt)

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

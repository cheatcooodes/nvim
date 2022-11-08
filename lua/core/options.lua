vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8" -- 文件编码格式
vim.opt.scrolloff = 8 -- 移动时保持显示光标上下8行
vim.opt.sidescrolloff = 16 -- 移动时保持显示光标左右16行
vim.opt.number = true -- 行号
vim.opt.relativenumber = false -- 相对行号
vim.opt.cursorline = true -- 高亮所在行
vim.opt.signcolumn = "yes" -- 左侧图标指示列
-- vim.opt.colorcolumn = "80" -- 换行参考线
vim.opt.tabstop = 2 -- tab缩进两个空格
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true -- 自动对齐
vim.opt.smartindent = true -- 智能对齐
vim.opt.ignorecase = true -- 搜索大小写不敏感，除非包含大写
vim.opt.smartcase = true
vim.opt.incsearch = true -- 边输入边搜索
vim.opt.cmdheight = 1 -- Neovim 命令行高度
vim.opt.autoread = true -- 文件被外部程序修改时自动加载
vim.opt.wrap = false -- 折行
vim.opt.hidden = true -- 允许隐藏修改过的 buffer
vim.opt.mouse = "a" -- 支持鼠标
vim.opt.backup = false -- 禁止自动备份
vim.opt.writebackup = false -- 禁止自动备份
vim.opt.swapfile = false -- 禁止创建备份文件
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300 -- 等待键盘快捷键连击时间(ms)
vim.opt.completeopt = {"menu","menuone","noselect","noinsert"} -- 自动补全设置
vim.opt.termguicolors = true -- 样式
-- vim.opt.list = true -- 显示不可见字符
-- vim.opt.listchars = "space:·,tab:··" -- 将不可见字符替换成"·"
vim.opt.shortmess = vim.o.shortmess .. "c"
vim.opt.pumheight = 10
vim.opt.showtabline = 1 -- 当至少有两个tab时才显示tabline
vim.opt.showmode = false -- vim 自带的模式提示
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板
vim.opt.undofile = true -- 持久撤消
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo") -- 保存撤销记录的目录
vim.opt.autowriteall = true -- 自动保存修改
vim.opt.splitbelow = true -- 水平分割的窗口总是从下面出现
vim.opt.splitright = true -- 垂直分割的窗口总是从右边出现
vim.opt.title = true -- Set the title of window to the value of the titlestring
vim.opt.guicursor = {
	"a:blinkwait700-blinkon400-blinkoff250", -- 光标闪烁
	"n-v-c-sm:block",
	"i-ci-ve:ver25",
	"r-cr-o:hor20"
}

-- Clipboard in WSL
if vim.fn.has("wsl") then
	local exists_clip = (string.find(vim.fn.system("clip.exe"),".*not%sfound.*") == nil)
	local exists_yank = (string.find(vim.fn.system("win32yank.exe"),".*not%sfound.*") == nil)
	if exists_clip and exists_yank then
		vim.g.clipboard = {
			name = 'wsl-clipboard',
			copy = {["+"] = "clip.exe", ["*"] = "clip.exe"},
			paste = {["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf"},
			cache_enabled = false
		}
	else
		vim.notify("clip.exe or win32yank.exe not found")
	end
end



local map = vim.keymap.set
local default_opts = { noremap=true, silent=true }


-- Leader key
vim.g.mapleader = " " -- <space>


-- === BASIC ===
-- 屏幕行之间跳转
map({"n","v"}, "j", "gj")
map({"n","v"}, "k", "gk")
-- 移动到行首/行尾 (屏幕行)
map({"n","v"}, "H", "g^")
map({"n","v"}, "L", "g$")
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
-- No highlight
map("n", "<ESC>", ":noh<CR>", { silent=true })
-- Quit terminal mode
map("t", "<ESC><ESC>", "<C-\\><C-n>")
map("t", "<C-w>h", "<C-\\><C-n><C-w>h")
map("t", "<C-w>j", "<C-\\><C-n><C-w>j")
map("t", "<C-w>k", "<C-\\><C-n><C-w>k")
map("t", "<C-w>l", "<C-\\><C-n><C-w>l")
-- Move selected line / block of text in visual mode (inspired by Lunarvim)
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")


-- === SWITCH ===
-- "\" -> Prefix for toggling some options 
-- Toggle relative line number
map("", "\\r", function()
    if vim.opt.relativenumber:get() then
      vim.opt.relativenumber = false
    else
      vim.opt.relativenumber = true
    end
  end, { desc = "Toggle relative line number" })
-- Toggle mouse mode
map("", "\\m", function()
		vim.notify("Mouse mode toggled")
		-- TODO
  end, { desc = "Toggle mouse mode" })
-- Open a terminal
map("", "\\t", function()
    vim.cmd([[vsplit|terminal]])
    vim.cmd([[startinsert]])
    vim.opt.number = false
    vim.opt.relativenumber = false
  end)
-- Code Runner
map("n", "<F5>", "Run", { silent=true })


-- === PLUGINS ===
-- hop.nvim
map('', 'r', "<cmd>HopWord<CR>")
-- map('','/',"<cmd>HopPattern<CR>")

-- luasnip
-- Jump to the next node
map('i', '<C-j>', "<cmd> lua require('luasnip').jump(1)<CR>") -- 覆盖掉换行功能



-- === MARKDOWN ===
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = "*.md",
	callback = function ()
		local opts = { buffer=0, silent=true }
		-- vim.notify("Markdown")
		-- "," -> Prefix for Markdown 
		map('v', ', b', ":s/\\%V.*\\%V./**&**/<CR>:noh<CR>`>2f*", opts)
		map('n', ', b', "a****<ESC>1h", opts)
		map('v', ', B', ":s/\\%V.*\\%V./***&***/<CR>:noh<CR>`>3f*", opts)
		map('n', ', B', "a******<ESC>2h", opts)
		map('v', ', d', ":s/\\%V.*\\%V./\\~\\~&\\~\\~/<CR>:noh<CR>`>2f~", opts)
		map('n', ', d', "a~~~~<ESC>1h", opts)
		map('v', ', l', ":s/\\%V.*\\%V./*&*/<CR>:noh<CR>`>f*", opts)
		map('n', ', l', "a**<ESC>", opts)
		map('v', ', m', ":s/\\%V.*\\%V./$&$/<CR>:noh<CR>`>f$", opts)
		map('n', ', m', "a$$<ESC>", opts)
		map('v', ', c', ":s/\\%V.*\\%V./`&`/<CR>:noh<CR>`>f`", opts)
		map('n', ', c', "a``<ESC>1h", opts)
		map('', ', 1', "mm0i# <ESC>`m2l", opts)
		map('', ', 2', "mm0i## <ESC>`m3l", opts)
		map('', ', 3', "mm0i### <ESC>`m4l", opts)
		map('', ', 4', "mm0i#### <ESC>`m5l", opts)
		map('', ', [', "mm0i- [ ] <ESC>`m6l", opts)
		map('', ', , ', "mm0i* <ESC>`ml", opts)
	end
})

-- === LSP ===

-- ...


local map = vim.keymap.set
local default_opts = { noremap=true, silent=true }


-- === CORE ===
-- Leader key
vim.g.mapleader = " " -- <space>

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
-- Toggle relative line number
map("", "<leader>r",
  function()
    if vim.opt.relativenumber:get() then
      vim.opt.relativenumber = false
    else
      vim.opt.relativenumber = true
    end
  end, { desc = "Toggle relative line number" })
-- Open a terminal
map("", "<Nop>",
  function()
    vim.cmd([[vsplit|terminal]])
    vim.cmd([[startinsert]])
    vim.opt.number = false
    vim.opt.relativenumber = false
  end)
-- Code Runner
map("n","<F5>","Run",{ silent=true })


-- === PLUGINS ===
-- hop.nvim
if pcall(require, "hop") then
  map('', 'r', "<cmd>HopWord<CR>")
  -- map('','/',"<cmd>HopPattern<CR>")
end


-- === MARKDOWN ===
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = "*.md",
	callback = function ()
		local opts = { buffer=0, silent=true }
		-- vim.notify("Markdown")
		map('v',',b',":s/\\%V.*\\%V./**&**/<CR>:noh<CR>`>2f*",opts)
		map('v',',d',":s/\\%V.*\\%V./\\~\\~&\\~\\~/<CR>:noh<CR>`>2f~",opts)
		map('v',',l',":s/\\%V.*\\%V./*&*/<CR>:noh<CR>`>f*",opts)
		map('v',',m',":s/\\%V.*\\%V./$&$/<CR>:noh<CR>`>f$",opts)
		map('',',1',"I# <ESC>g$",opts)
		map('',',2',"I## <ESC>g$",opts)
		map('',',3',"I### <ESC>g$",opts)
		map('',',4',"I#### <ESC>g$",opts)
	end
})


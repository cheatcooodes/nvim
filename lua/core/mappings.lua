local map = vim.keymap.set
local opts = { noremap=true, silent=true }


 --- CORE ---
-- Leader key
vim.g.mapleader = " " -- <space>

-- 屏幕行之间跳转
map("n", "j", "gj")
map("n", "k", "gk")
-- 移动到行首/行尾 (屏幕行)
map("n", "H", "g^")
map("n", "L", "g$")
map("v", "H", "g^")
map("v", "L", "g$")
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
map("n","<F5>","Run",{ silent=true })


 --- PLUGINS ---
-- hop.nvim
if pcall(require, "hop") then
  map('', 'r', "<cmd>HopWord<CR>")
  -- map('','/',"<cmd>HopPattern<CR>")
end



-- 屏蔽不常用的按键
-- R,r,T,t

-- 切换标签
-- <C-Tab>


-- Telescope
-- <leader>F

-- Toggle explorer
-- <C-e>

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

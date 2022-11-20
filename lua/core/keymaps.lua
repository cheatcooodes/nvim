local map = vim.keymap.set
local opts = { silent=true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Leader key
vim.g.mapleader = " " -- <space>

-- BASIC --
-- 屏幕行之间跳转
map({"n","v"}, "j", "gj")
map({"n","v"}, "k", "gk")
-- 移动到行首/行尾 (屏幕行)
map({"n","v"}, "H", "g^")
map({"n","v"}, "L", "g$")
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Clear highlight
map("n", "<ESC>", ":noh<CR>", { silent=true })
-- Quit terminal mode
map("t", "<ESC><ESC>", "<C-\\><C-n>")
-- Navigate in terminal mode
map("t", "<C-w>h", "<C-\\><C-n><C-w>h")
map("t", "<C-w>j", "<C-\\><C-n><C-w>j")
map("t", "<C-w>k", "<C-\\><C-n><C-w>k")
map("t", "<C-w>l", "<C-\\><C-n><C-w>l")
-- Move selected line / block of text in visual mode (inspired by Lunarvim)
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")
-- Better paste in visual mode
-- map("v", "p", '"_dP', opts)

-- SWITCH --
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

-- MARKDOWN --
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = "*.md",
	callback = function ()
		local bufopts = { buffer=0, silent=true }
		-- vim.notify("Markdown")
		-- "," -> Prefix for Markdown 
		-- **bold**
		map('v', ',b', ":s/\\%V.*\\%V./**&**/<CR>:noh<CR>`>2f*", bufopts)
		-- *italic*
		map('v', ',l', ":s/\\%V.*\\%V./*&*/<CR>:noh<CR>`>f*", bufopts)
		-- ~~delete~~
		map('v', ',d', ":s/\\%V.*\\%V./\\~\\~&\\~\\~/<CR>:noh<CR>`>2f~", bufopts)
		-- $math$
		map('v', ',m', ":s/\\%V.*\\%V./$&$/<CR>:noh<CR>`>f$", bufopts)
		-- `code`
		map('v', ',c', ":s/\\%V.*\\%V./`&`/<CR>:noh<CR>`>f`", bufopts)
		-- ***boldItalic***
		map('v', ',B', ":s/\\%V.*\\%V./***&***/<CR>:noh<CR>`>3f*", bufopts)
		-- # header 1 ~ 4
		map('', ',1', "mm0i# <ESC>`m2l", bufopts)
		map('', ',2', "mm0i## <ESC>`m3l", bufopts)
		map('', ',3', "mm0i### <ESC>`m4l", bufopts)
		map('', ',4', "mm0i#### <ESC>`m5l", bufopts)
		-- - [ ] checkbox
		map('', ',[', "mm0i- [ ] <ESC>`m6l", bufopts)
		-- - unorderedList 
		map('', ',,', "mm0i- <ESC>`m2l", bufopts)

	end
})

-- PLUGINS --
-- hop.nvim
map('', 'r', "<cmd>HopWord<CR>")

-- luasnip
-- Jump to the next node
map('i', '<C-j>', "<cmd> lua require('luasnip').jump(1)<CR>") -- 覆盖掉换行功能
-- vim.cmd([[imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']])
-- vim.cmd([[smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']])

-- vim-signature
map('', 'M', "<cmd>SignatureToggleSigns<CR>")

-- MarkdownPreview
map('', '\\p', "<cmd>MarkdownPreviewToggle<CR>")

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)


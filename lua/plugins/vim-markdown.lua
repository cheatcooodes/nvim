vim.g.vim_markdown_math = 1

local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufNewFile, BufRead"}, {
	command = "source $VIMRUNTIME/syntax/tex.vim"
})

-- Reference: https://www.1024sou.com/article/917995.html

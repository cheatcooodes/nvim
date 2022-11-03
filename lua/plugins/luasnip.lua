local types = require("luasnip.util.types")

-- local load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
-- 	markdown = {"latex", "tex"}
-- })
-- local ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype()

require'luasnip'.config.setup({
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = {{"●", "GruvboxOrange"}}
			}
		},
		[types.insertNode] = {
			active = {
				virt_text = {{"●", "GruvboxBlue"}}
			}
		}
	},

})

require("luasnip.loaders.from_vscode").lazy_load() -- vscode-like snippets

-- require('luasnip').setup({
--	load_ft_func = load_ft_func,
--	ft_func = ft_func,
-- })







local types = require("luasnip.util.types")

require'luasnip'.config.setup({
	--[[
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
	--]]

	-- Enable autotriggered snippets
	enable_autosnippets = true,

})

require("luasnip.loaders.from_vscode").lazy_load() -- vscode-like snippets

-- My snippets
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/snippets"})






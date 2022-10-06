if !exists('g:vscode')
	" --- CORE ---
	lua require("core.options")
	lua require("core.mappings")
	lua require("core.plugins")
	lua require("core.colorscheme")
	lua require("core.autocmds")
	lua require("core.usercmds")
	" --- PLUGINS ---

else
	lua require("core.options")
	lua require("core.mappings")

end



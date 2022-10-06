if !exists('g:vscode')
	" --- CORE ---
	lua require("core.colorscheme")
	lua require("core.options")
	lua require("core.mappings")
	lua require("core.autocmds")
	lua require("core.usercmds")
	" --- PLUGINS ---
	lua require("plugins")

else
	lua require("core.options")
	lua require("core.mappings")

end



-- https://github.com/nvim-lualine/lualine.nvim#tabs-component-options

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '⎟', right = '⎟'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', },
    lualine_c = {'filename'},
    lualine_x = {'diagnostics','filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
		lualine_a = {},
		lualine_b = {'filename'},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {'tabs'},
		lualine_z = {}
	},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Icons
--[[
vim.cmd("hi StatuslineIcon gui=reverse")
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local icon, color = require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype)
        vim.cmd("hi StatuslineIcon guibg=" .. color)
        vim.o.statusline =
        "%<%f %#StatuslineIcon#" ..
        icon ..
        "%##%h%m%r%=%-14.(%l,%c%V%) %P"
    end
})
--]]

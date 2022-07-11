-- Name : lualine
-- Repo : https://github.com/nvim-lualine/lualine.nvim

require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = 'tokyonight', -- Either check for included themes or install certain theme first
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '⡪⠪', right = '⠕⢕'},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff',
			{'diagnostics',
				symbols = { error = "X ", warn  = "! ", info  = "i ", hint  = "? " },
				always_visible = false,
			}
		},
		lualine_c = {
			{'filename',
				symbols = {modified = " ➕", readonly = " 🛡", unnamed = "[UNNAMED]"}
			}
		},
		lualine_x = {'encoding', 'filetype'},
		lualine_y = {},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{'filename',
				symbols = {modified = " ➕", readonly = " 🛡", unnamed = "[UNNAMED]"}
			}
		},
		lualine_x = {},
		lualine_y = {'filetype'},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
local alpha = require('alpha')

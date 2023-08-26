-- Name : lualine
-- Repo : https://github.com/nvim-lualine/lualine.nvim

return {"nvim-lualine/lualine.nvim",
	dependencies = { 
		'nvim-tree/nvim-web-devicons',
		'folke/tokyonight.nvim',
	},
	config = function()
		require("lualine").setup {
			options = {
				theme = 'tokyonight',
				icons_enabled = true,
				component_separators = { left = '|', right = '|'},
				section_separators = { left = '▒░', right = '░▒'},
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
	end
}


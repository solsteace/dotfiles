return {"goolord/alpha-nvim",
	config = function()
		-- Aliases and variables
		local dashboard = require('alpha.themes.dashboard')
		local v = vim.version()

		-- Header
		dashboard.section.header.val = { -- length : 34
			[[                                  ]],
			[[                                  ]],
			[[             ▇     ▇              ]],
			[[               ▜▇▛                ]],
			[[                                  ]],
			[[           Eyo, Allen!            ]],
			[[    What will it be for today?    ]],
			[[                                  ]],
			[[  :════════════════════════════:  ]],
			string.format("  %-9s                %s  ",  -- 2+9+[16]+5+2
				os.date("%A"), os.date("%H:%M")),
			string.format("  %02s %s %s             ", -- 2+2+1+9+1+4+[13]+2
				os.date("%d"), os.date("%B"), os.date("%Y")),
			[[  '════════════════════════════'  ]],
		}

		-- Menus
		dashboard.section.buttons.val = {
			dashboard.button('n','📑 New File',':ene<CR>'),
			dashboard.button('v','⚙  Settings',':e $MYVIMRC<CR>'),
			dashboard.button('q','⛌  Quit',':q<CR>'),
		}

		-- Footer
		dashboard.section.footer.val = {
			[[      Have a good time editing!    ]],
			string.format("            NVIM v%s.%s.%s", -- Config for total digits of 3
				v['major'], v['minor'], v['patch']),    -- Note: For each extra digit, delete a space
		}

		-- Set it up
		require("alpha").setup(dashboard.config)
	end,
}

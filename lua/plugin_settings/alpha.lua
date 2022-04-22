------------------------ Config file data ------------------------
-- Name : alpha-nvim
------------------------------------------------------------------

-- Aliases and variables
local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local v = vim.version() -- check via :lua for k, v in pairs(vim.version()) do print(k, v) end

-- Header
dashboard.section.header.val = { -- length : 34
	[[                                  ]],
	[[                                  ]],
	[[             ▇     ▇              ]],
	[[               ▜▇▛                ]],
	[[                                  ]],
	[[             Hi, Lan!             ]],
	[[    So, What will it be today?    ]],
	[[                                  ]],
	[[  ⠺════════════════════════════⠗  ]],
	string.format("  %-9s                %s  ",  -- 2+9+[16]+5+2
		os.date("%A"), os.date("%H:%M")),
	string.format("  %02s %-9s %s             ", -- 2+2+1+9+1+4+[13]+2
		os.date("%d"), os.date("%B"), os.date("%Y")),
	[[  ⠺════════════════════════════⠗  ]],
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
alpha.setup(dashboard.config)


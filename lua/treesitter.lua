local config = require("nvim-treesitter.configs")
local highlight = require("nvim-treesitter.highlight")

-- Remember to update it regularly!
config.setup {
	-- To use only maintained parsers, change to "maintained"
	ensure_installed = {"python", "cpp", "lua", "go"},
	highlight = {
		enable = true,
		-- Insert languages you want treesitter ignore here
		disable = {},
		 -- Just in case two highlighters overlap each other
		additional_vim_regex_highlighting = false,
	},
}

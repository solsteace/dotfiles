--[[ Plugin list ===================================================
     Note : This dotfile uses paq. You could use any plugin manager you
            like, but don't forget to change this section first. ]]--
require("paq") {
	-- Colors
	"catppuccin/nvim";
	"folke/tokyonight.nvim";

	--  Interface Sugar
	"nvim-lualine/lualine.nvim";
	"goolord/alpha-nvim";
	"kyazdani42/nvim-web-devicons";

	-- Utils
	"savq/paq-nvim";

	"nvim-treesitter/nvim-treesitter";
	"neovim/nvim-lspconfig";
	"williamboman/nvim-lsp-installer";
	"RishabhRD/nvim-lsputils";

	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
}

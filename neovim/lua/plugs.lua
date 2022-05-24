-- Plugin list ===================================================
-- Note : This dotfile uses paq. You could use any plugin manager you
--        like, but don't forget to change this section first.
require "paq" {
	-- Colors
	"ayu-theme/ayu-vim";
	"elianiva/icy.nvim";
	"catppuccin/nvim";
	"NLKNguyen/papercolor-theme"; -- Classic
	"folke/tokyonight.nvim";

	--  Interface Sugar
	"nvim-lualine/lualine.nvim";
	"goolord/alpha-nvim";
	"kyazdani42/nvim-web-devicons";
	"kyazdani42/nvim-tree.lua";


	-- Utils
	"savq/paq-nvim";

	"nvim-treesitter/nvim-treesitter";
	"neovim/nvim-lspconfig";
	"williamboman/nvim-lsp-installer";
	"RishabhRD/nvim-lsputils";

	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
}

-- More configs ==================================================
-- Note : Make sure you have all these plugins installed
require("plugin_settings.alpha") -- plugin_settings/alpha
require("plugin_settings.colo") -- plugin_settings/colo
require("plugin_settings.devicons") -- plugin_settings/devicons
require("plugin_settings.lualine") -- plugin_settings/lualine
require("plugin_settings.lsp")   -- plugin_settings/lsp
require("plugin_settings.nvimtree") -- plugin_settings/nvimtree
require("plugin_settings.treesitter")   -- plugin_settings/treesitter

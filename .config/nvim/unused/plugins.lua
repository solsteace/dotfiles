-- Snippet picked from nvim-lua/kickstart.nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(
	function(use)
		-- Essential
		use "wbthomason/packer.nvim"
	
		use {"nvim-treesitter/nvim-treesitter", 
			run = function()
				require('nvim-treesitter.install').update{ with_sync = true}
			end,
		}
		
		-- Language Server Protocol
		use {"neovim/nvim-lspconfig"}
		use {"RishabhRD/nvim-lsputils"}
		use {"williamboman/mason.nvim"} -- Install some LSP easier
		-- use {"nvimdev/lspsaga.nvim"} -- Show LSP doodahs prettier
	

		-- Telescope
		use {"nvim-lua/plenary.nvim"}
		use {"nvim-telescope/telescope.nvim",
			tag = "0.1.1",
			requires = {
				{"nvim-lua/plenary.nvim"}
			}
		}
		
		-- Autocompletion
		use{'hrsh7th/cmp-nvim-lsp'}
		use{'hrsh7th/cmp-buffer'}
		use{'hrsh7th/cmp-path'}
		use{'hrsh7th/cmp-cmdline'}
		use{'hrsh7th/nvim-cmp'}
			-- Supplies cmp
		use{'L3MON4D3/LuaSnip'}
		use{'saadparwaiz1/cmp_luasnip'}

		-- utils
			use {"kylechui/nvim-surround",
				tag = "*",
				config = function()
					require("nvim-surround").setup({
						-- Extra config goes here
					})
				end
			}
			-- Make writing HTML and CSS easier
				use {"mattn/emmet-vim"} 
			-- Discord rich presence
				use {"andweeb/presence.nvim"}

		-- Interface sugar
		use {"goolord/alpha-nvim"}
		use {"nvim-lualine/lualine.nvim"}
		use {"nvim-tree/nvim-web-devicons"}

		use {"folke/tokyonight.nvim"}
		use {"catppuccin/nvim", as = "catppuccin"}

		-- utils
		use {"dstein64/vim-startuptime"}
	end
)

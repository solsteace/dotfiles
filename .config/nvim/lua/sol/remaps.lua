--[[ Since this will very much likely be updated on every update,
     this dotfile will use the latest feature of neovim!
     Current compatibility: Neovim Version >= 7.0
]]--

---- Variables ================================================
	local map = vim.keymap.set
	local nore = {noremap = true}
	local sinore = {noremap = true, silent = true }
	vim.g.mapleader = " "
-- Remaps ===================================================
-- Buffer Commands ----------------------
	map('n', '<leader>bl', ':ls<CR>', nore)		  -- Peek opened buffer
	map('n', '<leader>bn', ':bnext<CR>', sinore)	  -- Go to next
	map('n', '<leader>bv', ':bprev<CR>', sinore)	  -- Go to previous
	map('n', '<leader>bb', ':b#<CR>', sinore) 	  -- Go to last opened
-- General Commands ---------------------
	-- Change current working directory to current file in buffer
		map('n', '<leader>cd', ':cd %:p:h<CR>:echo "Changed CWD to current file path"<CR>', nore)
	-- Remove highlight
		map('n', 'S', ':noh<CR>', nore)
	-- tab config
		map('n', '<leader>tn', ':tabnew<CR>', nore)
		map('n', '<C-l>', ':tabn<CR>', nore)
		map('n', '<C-h>', ':tabp<CR>', nore)
	-- Create [s]plit
		map('n', '<leader>sx', '<C-w>s', sinore)		  -- Vertical
		map('n', '<leader>sy', '<C-w>v', sinore)		  -- Horizontal
	-- Resize splits [Warning: Might work weirdly, so press however suits you]
		map('n', '<C-right>', ':vert res +2<CR>', sinore)
		map('n', '<C-left>', ':vert res -2<CR>', sinore)
		map('n', '<C-up>', ':res +2<CR>', sinore)
		map('n', '<C-down>', ':res -2<CR>', sinore)
	-- Navigate splits
		map('n', '<M-h>', '<C-w>h', nore)
		map('n', '<M-j>', '<C-w>j', nore)
		map('n', '<M-k>', '<C-w>k', nore)
		map('n', '<M-l>', '<C-w>l', nore)
	-- Scroll through vim command history
		map({'n', 'v'}, '<up>', ':<up>', nore)
		map({'n', 'v'}, '<down>', ':<down>', nore)
	-- Disabled keys
		map('n', '<BS>', '<Nop>', nore)
	-- Copy directory path of file
		map('n', '<leader>pt', ':let @+=expand("%:p:h")<CR>:echo "copied file directory"<CR>', nore)
-- Terminal Commands --------------------
	map('n', '<leader>tr', ':term<CR>', sinore) -- Open terminal (The one set at [:set shell?])
	map('t', '<esc>', '<C-\\><C-n>', nore) 		-- Exit terminal mode with esc
-- Command Aliases ----------------------
	vim.cmd [[:command W :w]]
-- Command Using Functions --------------

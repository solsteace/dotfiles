--[[ Since this will very much likely be updated on every update,
     this dotfile will use the latest feature of neovim!
     Current compatibility: Neovim Version >= 7.0
]]--

-- Variables ================================================
	local map = vim.keymap.set
	local nore = {noremap = true}
	local sinore = {noremap = true, silent = true }
	vim.g.mapleader = " "
-- Remaps ===================================================
-- Buffers ------------------------------
	map('n', '<leader>bl', ':ls<CR>', nore)		  -- Peek opened buffer
	map('n', '<leader>bn', ':bnext<CR>', sinore)	  -- Go to next
	map('n', '<leader>bv', ':bprev<CR>', sinore)	  -- Go to previous
	map('n', '<leader>bb', ':b#<CR>', sinore) 	  -- Go to last opened
-- General ------------------------------
	-- Change current working directory to current file in buffer
		map('n', '<leader>cd', ':cd %:p:h<CR>', nore)
	-- Remove highlight done by search
		map('n', 'S', ':noh<CR>', nore)
	-- tab config
		map('n', '<leader>tn', ':tabnew<CR>', nore)
		map('n', '<C-l>', ':tabn<CR>', nore)
		map('n', '<C-h>', ':tabp<CR>', nore)
	-- Create [s]plit
		map('n', '<leader>sx', '<C-w>s', sinore)		  -- Vertical
		map('n', '<leader>sy', '<C-w>v', sinore)		  -- Horizontal
	-- Resize splits [Warning: Might work weirdly, so press however suits you]
		map('n', '<right>', ':vert res +2<CR>', sinore)
		map('n', '<left>', ':vert res -2<CR>', sinore)
		map('n', '<up>', ':res +2<CR>', sinore)
		map('n', '<down>', ':res -2<CR>', sinore)
	-- Navigate splits
		map('n', '<M-h>', '<C-w>h', nore)
		map('n', '<M-j>', '<C-w>j', nore)
		map('n', '<M-k>', '<C-w>k', nore)
		map('n', '<M-l>', '<C-w>l', nore)
	-- Get recent vim commands
	-- Disabled keys
		map('n', '<BS>', '<Nop>', nore)
-- Terminal -----------------------------
	map('n', '<leader>tr', ':term<CR>', sinore) -- Open terminal (The one set at [:set shell?])
	map('t', '<esc>', '<C-\\><C-n>', nore) 		-- Exit terminal mode with esc
-- Function Related ---------------------
	-- Comment and uncomment out blocked line
	-- )> Not a multiline comment
	-- )> Available at visual mode)
	
	local comment_character = { -- To add your own, use square bracket for literal string!
		cpp = '//', 
		go = '//',
		glsl = '//',
		python = '#',
		lua = '--',
	}

	map({'n', 'v'}, '<leader>cc',
		function()
			local ftype = vim.bo.filetype
			local first = vim.fn.line("v")
			local last = vim.fn.line(".")

			if first > last then
				last = first
				first = vim.fn.line(".")
			end
			
			if comment_character[ftype] ~= nil then
				vim.cmd(string.format([[execute %d . "," . %d . 's/\S/%s&']],
						first, last, comment_character[ftype]))
				vim.cmd([[execute "noh"]])
			else 
				print(string.format("Sorry, %s comment haven't been added yet!", ftype))
			end
		end,
	sinore)

	map({'n', 'v'}, '<leader>cx',
		function()
			local ftype = vim.bo.filetype
			local first = vim.fn.line("v")
			local last = vim.fn.line(".")

			if first > last then
				last = first
				first = vim.fn.line(".")
			end
			
			if comment_character[ftype] ~= nil then
				vim.cmd(string.format([[execute %d . "," . %d . 's/%s/']],
						first, last, comment_character[ftype]))
				vim.cmd([[execute "noh"]])
			else 
				print(string.format("Sorry, %s decomment haven't been added yet!", ftype))
			end
		end,
	sinore)

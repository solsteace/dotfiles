-- Variables ================================================
	local map = vim.api.nvim_set_keymap
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
	-- Remove highlight
		map('n', 'S', ':noh<CR>', nore)
	-- tab config
		map('n', '<leader>tn', ':tabnew<CR>', nore)
		map('n', '<leader><C-l>', ':tabn<CR>', nore)
		map('n', '<leader><C-h>', ':tabp<CR>', nore)
	-- Create [s]plit
		map('n', '<leader>sx', '<C-w>s', sinore)		  -- Vertical
		map('n', '<leader>sy', '<C-w>v', sinore)		  -- Horizontal
	-- Resize splits [Warning: Might work weirdly, so press however suits you]
		map('n', '<right>', ':vert res +2<CR>', sinore)
		map('n', '<left>', ':vert res -2<CR>', sinore)
		map('n', '<up>', ':res +2<CR>', sinore)
		map('n', '<down>', ':res -2<CR>', sinore)
	-- Navigate splits
		map('n', '<C-h>', '<C-w>h', nore)
		map('n', '<C-j>', '<C-w>j', nore)
		map('n', '<C-k>', '<C-w>k', nore)
		map('n', '<C-l>', '<C-w>l', nore)
	-- Disabled keys
		map('n', '<BS>', '<Nop>', nore)
-- Terminal -----------------------------
	map('n', '<leader>tr', '<C-w>v:term<CR>', sinore) 	  -- Open cmd
	map('t', '<esc>', '<C-\\><C-n>', nore) 			  -- Exit terminal mode with esc
-- Visual
	-- Comment and uncomment out blocked line
		map('n', '<leader>cc', ':call Comment()<CR>:noh<CR>', sinore)
		map('n', '<leader>cx', ':call Uncomment()<CR>:noh<CR>', sinore)
		map('v', '<leader>cc', ':call Comment()<CR>:noh<CR>', sinore)
		map('v', '<leader>cx', ':call Uncomment()<CR>:noh<CR>', sinore)


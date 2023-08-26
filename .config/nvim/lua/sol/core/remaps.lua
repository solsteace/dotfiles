--[[ Since this will very much likely be updated on every update,
     this dotfile will use the latest feature of neovim!
     Current compatibility: Neovim Version >= 7.0 ]]--
---- Variables ================================================
	local map = vim.keymap.set
	local opt_n = {noremap = true}
	local opt_ns = {noremap = true, silent = true }
	vim.g.mapleader = " "

	local mapOpt = function (t1, desc)
		t1.desc = desc
		return t1
	end
	
-- Remaps ===================================================
-- Buffer Commands ----------------------
	map('n', '<leader>bl', ':ls<CR>', mapOpt(opt_n, "Peek buffers list"))
	map('n', '<leader>bn', ':bnext<CR>', mapOpt(opt_ns, "Go to next buffer in list"))
	map('n', '<leader>bv', ':bprev<CR>', mapOpt(opt_ns, "Go to previous buffer in list"))
	map('n', '<leader>bb', ':b#<CR>', mapOpt(opt_ns, "Go to last opened buffer"))
-- General Commands ---------------------
	map('n', '<leader>cd', ':cd %:p:h<CR>:echo "Changed CWD to current file path"<CR>', 
		mapOpt(opt_n, "Change directory to current file displayed in buffer"))
	map('n', 'S', ':noh<CR>', mapOpt(opt_n, "Remove search highlight"))

	-- tab config
	map('n', '<leader>tn', ':tabnew<CR>', mapOpt(opt_n, "Make new tab"))
	map('n', '<C-l>', ':tabn<CR>', mapOpt(opt_n, "Go to next tab"))
	map('n', '<C-h>', ':tabp<CR>', mapOpt(opt_n, "Go to Previous tab"))

	-- Split
	map('n', '<leader>sx', '<C-w>s', mapOpt(opt_ns, "Split Vertically"))
	map('n', '<leader>sy', '<C-w>v', mapOpt(opt_ns, "Split Horizontally"))

	-- Resize splits [Warning: Might work weirdly, so press however suits you]
	map('n', '<C-right>', ':vert res +2<CR>', mapOpt(opt_ns, "Resize vertically"))
	map('n', '<C-left>', ':vert res -2<CR>', mapOpt(opt_ns, "Resize vertically"))
	map('n', '<C-up>', ':res +2<CR>',  mapOpt(opt_ns, "Resize horizontally"))
	map('n', '<C-down>', ':res -2<CR>', mapOpt(opt_ns, "Resize horizontally"))

	-- Navigate splits
	map('n', '<M-h>', '<C-w>h', mapOpt(opt_n, "Go to upper split"))
	map('n', '<M-j>', '<C-w>j', mapOpt(opt_n, "Go to lower split"))
	map('n', '<M-k>', '<C-w>k', mapOpt(opt_n, "Go to right-er split"))
	map('n', '<M-l>', '<C-w>l', mapOpt(opt_n, "Go to left-er split"))

	-- Scroll through vim command history
	map({'n', 'v'}, '<up>', ':<up>', mapOpt(opt_n, "Scroll up command history"))
	map({'n', 'v'}, '<down>', ':<down>', mapOpt(opt_n, "Scroll down command history"))
	
	-- Disabled keys
	map('n', '<BS>', '<Nop>', opt_n)
	
	-- Copy directory path of file
	map('n', '<leader>pt', ':let @+=expand("%:p:h")<CR>:echo "copied file directory"<CR>', 
		mapOpt(opt_n, "Copy the path of current file showed in buffer"))

-- Terminal Commands --------------------
	map('n', '<leader>tr', ':term<CR>', mapOpt(opt_ns, "Open a terminal"))
	map('t', '<esc>', '<C-\\><C-n>', mapOpt(opt_n, "Exit terminal mode"))

-- Command Aliases ----------------------
	vim.cmd [[:command W :w]]

-- Command Using Functions --------------

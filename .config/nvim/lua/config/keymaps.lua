-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = function(isSilent, desc)
	return {
		silent = isSilent,
		desc = desc
	}
end

-- Tab Management
map("n", "<C-l>", ":tabn<CR>", opts(true, "Go to next tab"))
map("n", "<leader>tn", ":tabnew<CR>", opts(true, "Make new tab"))
map("n", "<C-h>", ":tabp<CR>", opts(true, "Go to previous tab"))

-- Navigate splits
map('n', '<M-h>', '<C-w>h', opts(true, "Go to upper split"))
map('n', '<M-j>', '<C-w>j', opts(true, "Go to lower split"))
map('n', '<M-k>', '<C-w>k', opts(true, "Go to right-er split"))
map('n', '<M-l>', '<C-w>l', opts(true, "Go to left-er split"))


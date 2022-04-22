--=================================================
-- This lua file is for detecting custom filetypes
--=================================================
vim.cmd [[
		" Psuedocode syntax/psu.vim
		au BufNewFile,BufRead *.psu set filetype=psu
		au BufNewFile,BufRead *.psu setfiletype=psu
		
		" let &runtimepath= &runtimepath . ',' . '$MYVIMRC/../lua/syntax'

		" More in here....
	]]

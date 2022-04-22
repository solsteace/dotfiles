local cmd = vim.cmd
-- VIML =========================================================
	cmd [[
		" Comment and uncomment
		fun! Comment() range
			let ftype = &filetype
			if ftype == "go" || ftype == "cpp"
				execute a:firstline . "," . a:lastline . 's/^/\/\/'
			elseif ftype == "python"
				execute a:firstline . "," . a:lastline . 's/^/#'
			elseif ftype == "lua" || ftype == "sql"
				execute a:firstline . "," . a:lastline . 's/^/--'
			endif
		endfun

		fun! Uncomment() range
			let ftype = &filetype
			if ftype == "go" || ftype == "cpp"
				execute a:firstline . "," . a:lastline . 's/\/\///e'
			elseif ftype == "python"
				execute a:firstline . "," . a:lastline . 's/#//e'
			elseif ftype == "lua" || ftype == "sql"
				execute a:firstline . "," . a:lastline . 's/--//e'
			endif
		endfun
	]]

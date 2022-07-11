" ================================
" || Vim syntax File			||
" || Language : Psuedocode		||
" ================================

" Keywords
	" program
	syn keyword psuBody program kamus algoritma endprogram
	" function
	syn keyword psuBody function endfunction
	" procedure
	syn keyword psuBody procedure endprocedure
	
	" if-then 
	syn keyword psuKword if else then endif
	" loop
	syn keyword psuKword to do for endfor while endwhile
	" I/O
	syn keyword psuKword read input output print write
	" Others
	syn keyword psuKword return of upto downto

	" parameters
	syn keyword psuKword in out
	syn match psuKword /in\/out/
	
	" datatypes (Primitive)
	syn keyword psuType integer real string char boolean type array
	syn keyword psuConst constant const
	
	" operators (using 'psuOperator' somehow not working hmmmm)
	syn keyword psuOpera div mod or not and 
	syn match psuOpera /!/
	syn match psuOpera /<-/
	syn match psuOpera /->/
	syn match psuOpera /</
	syn match psuOpera />/
	syn match psuOpera /=\+/
	syn match psuOpera /+/
	syn match psuOpera /-/
	syn match psuOpera /\//
	syn match psuOpera /\*/

	" Indexing and defining array index range
	syn match psuNumber /\[[^\]]\+\]/

	" Numbers
	syn match psuNumber /\W[+-]\=\d\+\(\.\d\+\)\=\([eE][+-]\=\d\+\)\=/
	
	" string and char
	syn match psuText /[^\a]".*"/
	syn match psuText /[^\a]'.'/

	" comment
	syn match psuComment /\/\/.*/
	" specification
	syn region psuComment start=/{/ end=/}/
	
let b:current_syntax = "psuedo"

" Coloring
hi def link psuComment Comment
hi def link psuConst Constant
hi def link psuNumber Constant
hi def link psuBody Error
hi def link psuText Identifier
hi def link psuKword Statement
hi def link psuOpera Type
hi def link psuType Type

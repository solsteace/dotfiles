" ================================
" || Vim syntax File			||
" || Language : Psuedocode		||
" || Author : Lan				||
" ================================

" Keywords
	" program
	syn keyword psuBody program kamus algoritma endprogram
	" function
	syn keyword psuBody function endfunction
	" procedure
	syn keyword psuBody procedure endprocedure
	
	" if-then 
	syn keyword psuKeys if else then endif
	" loop
	syn keyword psuKeys to do for endfor while endwhile
	" I/O
	syn keyword psuKeys read input output print write
	"parameters
	setlocal iskeyword+=/
	syn keyword psuKeys in in/out
	
	" datatypes
	syn keyword psuTypes integer real string char boolean
	
	" operators
	syn keyword psuOperators div mod and or not
	syn match psuOperators '\.\.\.'
	
	" integer
	syn match psuNumber '[^a-z]\d\+'
	" real
	syn match psuNumber '\d\+\.\d*'
	syn match psuNumber '[-+]\d\+\.\d*'
	syn match psuNumber '\d\+\.\d*[eE]\d\+'
	syn match psuNumber '[-+]\d\+\.\d*[eE]\d\+'

	" string and char
	syn match psuText '["'].*["']'

	" comment
	syn match psuComment '\/\/.*'
	" specification
	syn region psuComment start=/{/ end=/}/
	
	" function name
	syn match psuFunc "[(function [^0-9].*)(program [^0-9].*)(procedure [^0-9].*)]"

" Coloring
let b:current_syntax = "psu"

hi def link psuComment Comment
hi def link psuNumber Constant
hi def link psuBody Error
hi def link psuText Identifier
hi def link psuFunc Identifier
hi def link psuOperators Operator
hi def link psuKeys Statement
hi def link psuTypes Type


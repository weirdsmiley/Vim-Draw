" Autoload dir for plugin
" will only be invoked when needed
" reduces boot-time for Vim

function! draw#CreateSolidBox()
	" newline
	execute "normal! o"
	" top left corner
	execute "normal! \<ESC>A\<C-k>dr\<ESC>"
	" top 16 horizontals
	execute "normal! \<ESC>16A\<C-k>hh\<ESC>"
	" top right corner
	execute "normal! \<ESC>A\<C-k>dl\<ESC>"
	" newline
	execute "normal! o"
	" left vertical
	execute "normal! \<ESC>A\<C-k>vv\<ESC>"
	" 16 whitespaces
	execute "normal! \<ESC>16A \<ESC>"
	" right vertical
	execute "normal! \<ESC>A\<C-k>vv\<ESC>"
	" newline
	execute "normal! o"
	" bottom left corner
	execute "normal! \<ESC>A\<C-k>ur\<ESC>"
	" bottom 16 horizontals
	execute "normal! \<ESC>16A\<C-k>hh\<ESC>"
	" bottom right corner
	execute "normal! \<ESC>A\<C-k>ul\<ESC>"
	" move cursor to writing position
	execute "normal! k15h"
	" execute "normal! \<Insert>\<Insert>"
endfunction

function! draw#CreateDottedBox()
	" newline
	execute "normal! o"
	" top left corner
	execute "normal! \<ESC>A+\<ESC>"
	" top 16 horizontals
	execute "normal! \<ESC>16A-\<ESC>"
	" top right corner
	execute "normal! \<ESC>A+\<ESC>"
	" newline
	execute "normal! o"
	" left vertical
	execute "normal! \<ESC>A|\<ESC>"
	" 16 whitespaces
	execute "normal! \<ESC>16A \<ESC>"
	" right vertical
	execute "normal! \<ESC>A|\<ESC>"
	" newline
	execute "normal! o"
	" bottom left corner
	execute "normal! \<ESC>A+\<ESC>"
	" bottom 16 horizontals
	execute "normal! \<ESC>16A-\<ESC>"
	" bottom right corner
	execute "normal! \<ESC>A+\<ESC>"
	" move cursor to writing position
	execute "normal! k15h"
endfunction

function! draw#CreateNDottedBox(n)
	" generate (n x 1) matrix
	let row = 1
	while row <= a:n
		call draw#CreateDottedBox()
		execute "normal! i"
		let row += 1
	endwhile
	" delete extra lines and put cursor to the first line (if n>1)
	if a:n > 1
		execute "normal! j" . (a:n-1) . "dd" . (2*a:n) . "k"
	else
		execute "normal! k0"
	endif
endfunction


function! draw#CreateNMDottedBox(dimension)
	" handling corner case when either row/col = 1
	if a:dimension[1] == 1
		call draw#CreateNDottedBox(a:dimension[0])
	else
		" generate n x m sized matrix
		let row = 1
		let col = 1
		" create dimension[0] x 1 matrix
		call draw#CreateNDottedBox(a:dimension[0])
		" complete dimension[0] x dimension[1] matrix
		while row <= 2*a:dimension[0]+1
			execute "normal! yy" . (a:dimension[1]-1) . "pk"
			let col = 1
			" replay yank/paste for d[1]-1 columns
			while col <= a:dimension[1]-1
				execute "normal! Jxx"
				let col += 1
			endwhile
			" move to next line
			execute "normal! j"
			let row += 1
		endwhile
		" adjust cursor position
		execute "normal! " . (2*a:dimension[0]) . "k0jll"
	endif
endfunction

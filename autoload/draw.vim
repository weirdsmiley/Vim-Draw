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

" not working
function! draw#CreateNDottedBox()
	" store position @b
	execute "normal! qb"
	" create 1 diagram
	execute "normal! :call draw#CreateDottedBox()<cr>"
	" stop recording
	execute "normal! q"
	" repeat n-times
	execute "normal! 4@b"
	" delete extra lines below
	execute "normal! j4dd"

endfunction


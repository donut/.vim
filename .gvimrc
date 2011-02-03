" Size of GVim window
set lines=40 columns=95

" Don't display the menu or toolbar. Just the screen.
set guioptions-=m
set guioptions-=T

" Font. Very important.
if has('win32') || has('win64') 
	" set guifont=Monaco:h16
	" http://jeffmilner.com/index.php/2005/07/30/windows-vista-fonts-now-available/
	set guifont=Consolas:h12:cANSI
elseif has("gui_macvim")
   set guifont=Monofur:h13
elseif has('unix')
	let &guifont="Monospace 10"
endif

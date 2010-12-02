" My Vimrc file
" Maintainer: Donovan Muelle <zotobi@gmail.com>
" Reference: Initially based on http://dev.gentoo.org/~ciaranm/docs/vim-guide/
" with great help from http://nvie.com/posts/how-i-boosted-my-vim/
" License: www.opensource.org/licenses/bsd-license.php

" Disable Vi compatibility mode
set nocompatible

" Helps keep plugins organzied.
" Each plugin has its own directory in
" ~/.vim/bundles
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
"let mapleader=","

" Hide buffers, don't close them
" This avoids always having to undo or
" save changes on buffer switch
set hidden


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Misc. 
inoremap kj <Esc>
                   " Convenient way to get out of insert mode.
nnoremap ; :
                   " make writing commands a bit faster
set scrolloff=5    " Minimal number of screen lines to keep above and below the cursor.
set encoding=utf-8 " Use UTF8 encoding
set wildignore=*.swp,*.bak,*.pyc,*.class,*.DS_Store
                   " files tab completion should ignore
set title          " change the terminal's title
set visualbell     " don't beep
set noerrorbells   " don't beep
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
                   " Enable shift+arrow key selection of text in insert mode
endif
set pastetoggle=<F2>
                   " Toggle paste mode for large pasting
cmap w!! w !sudo tee % >/dev/null
                   " Write a file requiring sudo permissions



" Tabs & indenting
set tabstop=3     " A tab is X spaces
set expandtab     " Expand tabs into spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=3  " Number of spaces for auto-indenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set smartindent   " Automatically indent when adding a curly bracket, etc.


" line wrapping
set nowrap             " don't wrap lines
 "set linebreak           " soft wrap long lines
 "let &showbreak = '  ' " marker to show wrapped lines
set backspace=indent,eol,start
                        " allow backspacing over everything in insert mode

" Search
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
nmap <silent> ,/ :nohlsearch<CR>
                  " Clear highlights from search


" History & Undo
set history=1000     " remember more commands and search history
set undolevels=1000  " use many muchos levels of undo
set nobackup
set noswapfile


" Splits
map <C-h> <C-w>h  " Single step split navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Making Things Pretty
if &t_Co >= 256 || has("gui_running")
	 colorscheme mayansmoke
endif

if &t_Co > 2 || has("gui_running")
	" turn on syntax highlighting when colors are available.
   syntax on
endif

set cursorline " highlight current line


" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


" Editing
nmap <D-M-l> ^v$h
                  " select line contents


" Display incomplete commands.
set showcmd

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a


" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Filetype settings
filetype plugin indent on " indenting intelligence based on file type

if has('autocmd')
   " magic
endif

" File Commands
:command! -nargs=1 -range Spaces2Tabs <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g " From: http://vim.wikia.com/wiki/Super_retab

" CommandT Plugin Settings
let g:CommandTMatchWindowAtTop=1
let g:CommandTCancelMap='kj'

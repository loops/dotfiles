" Happy Vimming

set nocompatible	" Use Vim defaults (much better!)

" Desired leader for controlling extensions
let mapleader = ","

" Probably defaults anyway
syntax on
filetype on
filetype plugin on
filetype indent on

" Switch between multiple open files, hiding those not visible
set hidden

" Keep a lot of previous command in history buf
set history=1000

" Case insensitive searching unless search includes uppercase chars
set ignorecase
set smartcase

" Anticipate proper indentation level for each new line
set autoindent

" Make window-pane less painful
nmap <silent><leader>w <c-w>
noremap <silent><c-w>\| :vsplit<cr>
noremap <silent><c-w>_ :split<cr>

" Add ,, to end of suffixes so compiled programs aren't tab-completed as readily
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,,

" Don't strain for escape key or colon
inoremap jj <ESC>
nnoremap ; :
nnoremap Q q:
nnoremap q; q:

" Set this so that the plugin which highlights perl variables acts faster:
set ut=50

" Use an undo file
set undofile
set undodir=~/.vimundo/

" With easy undoing, we can autowrite, this is great when using ^Z to drop out to the shell
set autowriteall

" Disable wrapping of long lines by default
set nowrap

" Remember proper column, when popping back to previous line
nnoremap '' ``
nnoremap `` ''

" Use 4 space tabs
set autoindent                 " Automatically tab to starting column
set smartindent                " Default indenting scheme unless overridden by filetype
set expandtab                  " Don't use real tabs, use space instead
set tabstop=4                  " Use 4 spaces when TAB is pressed
set shiftwidth=4               " Use tabstop-spaces when auto indenting
set softtabstop=4              " Backspace from tab stop will remove previous shiftwidth
set backspace=indent,eol,start " So we can backspace back past insertion start point

" Spelling and highlight defaults
set nohlsearch
set spell

" Show partial command input in status line and Ex menu
set showcmd
set wildmenu

" When jumping to new line, don't go to column 0
set nostartofline

" Reduce need to press ENTER when changing files etc..
set shortmess=at

" Don't show startup introduction screen
set shortmess+=I

" Pretty colors
colorscheme onedark

" Temporary solution for Shift-Tab
nnoremap <esc>[Z <c-o>
inoremap <esc>[Z <c-h>

" Make sure that you can always undo a ctrl-u or ctrl-w in insert mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Open file at same line _and_ column as it was last time file was open
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"zz" | endif
endif


" So find searches files recursively
set path+=**

" Display all matching files when we tab complete
set wildmenu

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" highlight search query as you type
set incsearch

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable Omni-completion
set omnifunc=syntaxcomplete#Complete

" Load an indent file for the detected file type.
filetype indent on

" Turn on ruler so we can see curson column
set ruler

" Turn syntax highlighting on.
syntax on

" Enable persistent undo
set undofile
set undodir=~/.vim/undo
if !isdirectory($HOME . '/.vim/undo')
  call mkdir($HOME . '/.vim/undo', 'p')
endif

" Turn off modeline
set nomodeline

" Disable wrap
set nowrap

" Set relative numbers on
set number
set relativenumber

" Set tab rules
set tabstop=8

" Message color customization
hi Error ctermfg=black ctermbg=red cterm=bold
hi ErrorMsg ctermfg=black ctermbg=red cterm=bold
hi MoreMsg ctermfg=black ctermbg=red cterm=bold   

" Enable plugins and load plugin for the detected file type.
filetype plugin on
	
" Set colorscheme
set termguicolors
try 
	colorscheme catppuccin_macchiato
catch
	colorscheme retrobox
endtry

" turn off bell
set belloff=all
	
" ===================================================
" 		  DISABLED SETTINGS
" ===================================================
if 0
	" Enable type file detection. Vim will be able to try to detect the type of file in use.
	filetype on
	
	" My remaps
	nnoremap <SPACE> <Nop>
	let mapleader=" "
	inoremap jk <ESC>
	nnoremap <leader>fw :w<CR>
	nnoremap <leader>fq :q<CR>
	nnoremap <leader>wv :vsplit<CR>
	nnoremap <leader>ws :split<CR>
	nnoremap <leader>wq :q<CR>
	nnoremap <leader>wh <C-w>h
	nnoremap <leader>wj <C-w>j
	nnoremap <leader>wk <C-w>k
	nnoremap <leader>wl <C-w>l
	nnoremap <leader>bb :ls<CR>
	nnoremap <leader>b! :ls!<CR>
	
	" My plugins that I use
	packadd vimcomplete
	packadd vim-airline
	packadd vim-airline-themes
	
	" Options for: vim-airline-themes
	let g:airline_theme='google_dark' 
	let g:airline_section_y = []
	let g:airline_extensions = []
	let g:airline_section_z = airline#section#create_right(['%p%%', '%l/%L', 'c%c'])
	
	" Options for: vimcomplete
	let g:vimcomplete_tab_enable = 1
	source ~/.vim/config/vimcomplete.vim
endif


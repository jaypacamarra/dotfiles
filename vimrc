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

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Enable Omni-completion
set omnifunc=syntaxcomplete#Complete

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Turn off modeline
set nomodeline

" Disable wrap
set nowrap

" Set relative numbers on
set number
set relativenumber

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

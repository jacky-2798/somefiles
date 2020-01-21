syntax on
let mapleader=" "


set nocompatible
filetype on
filetype indent on
filetype plugin on 
filetype plugin indent on 
let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
set foldmethod=indent
"set foldlevel=99
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set number
set relativenumber
set cursorline
set wrap
set showcmd
set cc=0
set showmatch
set shiftwidth=4
set laststatus=2
set ruler
set ignorecase
set hlsearch
set incsearch
exec "nohlsearch"
noremap <LEADER><CR> :nohlsearch<CR>
set wildmenu
set magic
set smartindent

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

noremap = nzz
noremap - Nzz
noremap U 5k
noremap E 5j


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

call plug#end()

"===snazzy
colorscheme snazzy
let g:SnazzyTransparent = 1
"===



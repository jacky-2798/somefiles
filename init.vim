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
set scrolloff=6
set completeopt=menu

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

noremap = nzz
noremap - Nzz
noremap U 5k
noremap E 5j

" Undo operations
noremap l u
" Undo in Insert mode
inoremap <C-l> <C-u>

" Insert Key
noremap k i
noremap K I

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Visual Block Mode
noremap <LEADER>v <C-v>

noremap n h
noremap u k
noremap e j
noremap i l

" N key: go to the start of the line
noremap N 0
" I key: go to the end of the line
noremap I $

" set h (same as n, cursor left) to 'end of word'
noremap h e
 
 " Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
inoremap <C-U> <Esc>5<C-y>a
inoremap <C-E> <Esc>5<C-e>a

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>



hi Normal ctermfg=252 ctermbg=none

"== CompileRun
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
	exec "!g++ % -o %<"
	exec "! ./%<"
    elseif &filetype == 'cpp'
	exec "!g++ % -o %<"
	exec "! ./%<"
    elseif &filetype == 'java'
	exec "!javac %" 
	exec "!java %<"
    elseif &filetype == 'sh'
	:!./%
    elseif &filetype == 'py'
	exec "!python %"
	exec "!python %<"
    endif
endfunc


call plug#begin('~/.config/nvim/plugged')

Plug 'ajmwagar/vim-deus'
Plug 'theniceboy/eleline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"===Dress up
"colorscheme snazzy
"let g:SnazzyTransparent = 0.5
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus
hi NonText ctermfg=gray guifg=grey10
let g:airline_powerline_fonts = 1
"===

" === airline-themes
"let g:airline_theme='luna'
" ===

" === NERDTree
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" == NERDTree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


"set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

"C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 " to not notice you load local configuration file


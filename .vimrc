" ==== Vundle ====
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

let g:airline#extensions#tabline#enabled = 1



" color scheme
Bundle 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree
" https://github.com/scrooloose/nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

" ==== my favorite configure ====
" ---- completion ----
set omnifunc=syntaxcomplete#Complete
" ---- indentation ----
set tabstop=4
set expandtab
" ---- colorscheme ----
set t_Co=256

try
	colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" ---- appearance ----
syntax on
set number
set laststatus=2
set list
set listchars=tab:\ \ ,trail:_,precedes:<,extends:>
set showcmd
set splitbelow
set splitright
let g:netrw_liststyle=3

" ---- completion ----
set wildmenu

" ---- key bindings ----
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

" ---- search ----
set hlsearch
set incsearch
set smartcase
set wrapscan

" ---- file settings ----
" swap file to the ramdisk
if has("win32")
set directory=/tmp
endif
if has("unix")
  if system('uname')=~'Darwin'
    set directory=/Volumes/ramdisk
  else
    set directory=/dev/shm
  endif
endif

" encoding
set fileencodings=utf-8
set encoding=utf-8
set fileformats=unix,dos

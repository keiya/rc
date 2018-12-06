set nocompatible

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-endwise'

" Initialize plugin system
call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" NERDTree
" https://github.com/scrooloose/nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

" fzf
nmap ; :Buffers<CR>
nmap t :Files<CR>
nmap r :Ag<CR>

" ==== my favorite configure ====
" ---- completion ----
set omnifunc=syntaxcomplete#Complete
" ---- indentation ----
set tabstop=2
set shiftwidth=2
set expandtab
set breakindent
set smarttab
set smartindent
" ---- colorscheme ----
set t_Co=256

colorscheme slate

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
set backspace=indent,eol,start

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
"    set directory=/Volumes/ramdisk
    set directory=/tmp
  else
    set directory=/dev/shm
  endif
endif

" encoding
set fileencodings=utf-8
set encoding=utf-8
set fileformats=unix,dos

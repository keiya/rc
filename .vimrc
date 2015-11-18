" ==== Vundle ====
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache'

" color scheme
Bundle 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ---- Plugin specific configure ----
" Neocomplecache
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
let g:neocomplcache_enable_at_startup = 1 

" NERDTree
" https://github.com/scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==== my favorite configure ====
" ---- colorscheme ----
set t_Co=256
colorscheme molokai

" ---- appearance ----
syntax on
set number
set laststatus=2
set list
set listchars=tab:>\ ,trail:_,precedes:<,extends:>
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
set directory=/tmp

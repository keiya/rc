" Author:		Keiya Chinen, keiyac
" Last Change:	2010/07/29
scriptencoding utf-8
syntax on
filetype plugin on
filetype indent on
augroup vimrc
autocmd!
augroup end

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" set
set ttimeoutlen=10
set tabstop=4
set tabpagemax=100
set modelines=5
set nocompatible
set diffopt=filler,icase,iwhite
set noerrorbells
set noexpandtab
set noinsertmode
set visualbell
set backspace=indent,start,eol
set fileformats=unix,dos,mac
set helplang=ja,en
set nrformats-=octal
set nrformats+=alpha
if exists('&ambiwidth')
	set ambiwidth=double
endif

" 外観
set cmdheight=1
set cursorline
set eadirection=both
set equalalways
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:-
set laststatus=2
set list
set listchars=tab:»\ ,trail:_,precedes:«,extends:»
set number
set ruler
set shortmess=at
set showbreak=>>
set showcmd
set showmode
set statusline=%n:%<\ %f%a\ %m%r%h%w%y[%{&fenc!=''?&fenc:&enc}][%{&ff}]%=pos:%l,%c%V\ %obytes\ 0x%06.6B\ %03.3p%%
set notitle
set nowrap
" set display=uhex

" タブ/バッファ
set showtabline=2
set hidden
set splitbelow
set splitright

" 検索
set hlsearch
set ignorecase
set incsearch
set matchpairs+=<:>
set matchtime=3
set report=0
set showmatch
set smartcase
set wrapscan

" 補完
"set complete=.,w,b,u,U,t,i,d,k
set completeopt=menu,longest,preview
"set tags=~/.vim/systags,./tags,../tags,./*/tags,~/.tags/*/tags
set wildmenu
set wildmode=list:longest,full
"if exists( "+omnifunc" )
"	if &omnifunc == ""
"		setlocal omnifunc=syntaxcomplete#Complete
"	endif
"endif

" インデント
set autoindent
set shiftwidth=4
set cinoptions=:0g0
set copyindent
set smartindent
set formatoptions+=nM

" ファイルブラウズ
set browsedir=current
let g:netrw_liststyle=1
let g:netrw_http_cmd="wget -q -O"

" 自動文字コード判別
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,euc-jp,sjis,cp932
set termencoding=utf-8
if has('autocmd')
	autocmd vimrc BufReadPost * call AU_ReCheck_FENC()
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
endif

" 自動バックアップ
set backup
set backupdir=~/.backup/vim
set viewdir=~/.backup/view
if has( "autocmd" )
	autocmd vimrc BufWritePre * call UpdateBackupFile()
	function! UpdateBackupFile()
		let dir = strftime("~/.vim/backup/%Y/%m/%d", localtime())
		if !isdirectory(dir)
			let retval = system("mkdir -p ".dir)
			let retval = system("chown $UID:$GROUPS ".dir)
		endif
		exe "set backupdir=".dir
		unlet dir
		let ext = strftime("%H_%M_%S", localtime())
		exe "set backupext=.".ext
		unlet ext
	endfunction
endif

" mapping
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap j gj
nmap k gk

nmap <ESC><ESC> :nohlsearch<CR><ESC>

map \mm :set aw \| make \| set noaw<CR>
map \mn :set aw \| make clean \| set noaw<CR>

map [H <Home>
map! [H <Home>
map [F <End>
map! [F <End>

nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

nmap gc `[v`]
vmap gc :<C-u>normal gc<Enter>
omap gc :<C-u>normal gc<Enter>


" Fold関係
set foldlevel=1
set foldnestmax=2
set foldmethod=syntax
set foldcolumn=3


" Color関係
highlight Comment ctermfg=5
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
highlight Folded ctermbg=darkgray ctermfg=white
highlight FoldColumn ctermbg=0
highlight StatusLineNC ctermfg=darkgray ctermbg=gray
highlight NonText ctermfg=black
highlight SpecialKey ctermfg=darkgray
highlight CursorLine NONE cterm=underline
highlight ZenkakuSpace cterm=underline ctermbg=white ctermfg=blue
autocmd vimrc VimEnter,WinEnter * match ZenkakuSpace /　/

" xterm-256color関係
let s:colourcube_values = [ 0x00, 0x5F, 0x87, 0xAF, 0xD7, 0xFF ]
let s:base16_values = 	[ [ 0x00, 0x00, 0x00 ]
\			, [ 0xCD, 0x00, 0x00 ]
\			, [ 0x00, 0xCD, 0x00 ]
\			, [ 0xCD, 0xCD, 0x00 ]
\			, [ 0x00, 0x00, 0xEE ]
\			, [ 0xCD, 0x00, 0xCD ]
\			, [ 0x00, 0xCD, 0xCD ]
\			, [ 0xE5, 0xE5, 0xE5 ]
\			, [ 0x7F, 0x7F, 0x7F ]
\			, [ 0xFF, 0x00, 0x00 ]
\			, [ 0x00, 0xFF, 0x00 ]
\			, [ 0xFF, 0xFF, 0x00 ]
\			, [ 0x5C, 0x5C, 0xFF ]
\			, [ 0xFF, 0x00, 0xFF ]
\			, [ 0x00, 0xFF, 0xFF ]
\			, [ 0xFF, 0xFF, 0xFF ] ]
function! s:abs( n )
	if a:n > 0
		return a:n
	else
		return (0 - a:n)
	end
endfunction

function! ESC2RGB( esc )
	let esc = a:esc
	if esc < 16
		return s:base16_values[a:esc]
	endif
	let esc = esc - 16
	if esc < 216
		let r = s:colourcube_values[(esc / 36) % 6]
		let g = s:colourcube_values[(esc / 6) % 6]
		let b = s:colourcube_values[esc % 6]
		return [r,g,b]
	endif
	let esc = esc - 216
	if esc < 24
		let y = 8 + esc * 10
		return [y,y,y]
	endif
	let esc = esc - 24
	echom "unknown esc code: " (esc+256)
	return
endfunction

let s:esc2rgbDict = {}
for i in range( 0, &t_Co - 1 )
	let s:esc2rgbDict[i] = ESC2RGB(i)
endfor

function! RGB2ESC( rgb )
	let rgb = a:rgb
	if rgb[0] ==? "#"
		let rgb = rgb[1:]
	endif
	if strlen( rgb ) == 6
		let r = str2nr(rgb[0] . rgb[1], 16 )
		let g = str2nr(rgb[2] . rgb[3], 16 )
		let b = str2nr(rgb[4] . rgb[5], 16 )
	elseif strlen( rgb ) == 3
		let r = str2nr(rgb[0] . rgb[0], 16 )
		let g = str2nr(rgb[1] . rgb[1], 16 )
		let b = str2nr(rgb[2] . rgb[2], 16 )
	else
		echom "format error for: " . a:rgb
		return
	endif

	let mindiff = 20 " 妥協
	let diff = 0xff * 3
	let index = 0
	for i in range( 0, &t_Co - 1 )
		let d	= s:abs( s:esc2rgbDict[i][0] - r )
\			+ s:abs( s:esc2rgbDict[i][1] - g )
\			+ s:abs( s:esc2rgbDict[i][2] - b )
		if d < mindiff
			return i
		elseif d < diff
			let diff = d
			let index = i
		endif
	endfor
	return index
endfunction

" errorformat関係
if has( "autocmd" )
	autocmd vimrc filetype prolog set errorformat^=ERROR:\ %f:%l:%c:\ %m
endif
set errorformat+=%D%*\\a[%*\\d]:\ ディレクトリ\ `%f'\ に入ります
set errorformat+=%X%*\\a[%*\\d]:\ ディレクトリ\ `%f'\ から出ます

" いろいろ
if has( "autocmd" )
	autocmd vimrc BufReadPost * if 0 < line("'\"") && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" ファイルタイプ毎の追加オプション {{{1
" Haskell
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1
let hs_allow_hash_operator = 1
let lhs_markup = "tex"
" Lisp
let g:lisp_instring = 1
let g:lisp_rainbow = 1
" SQL
let msql_sql_query = 1
" Python
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1
let python_highlight_all = 1
" Readline with Bash
let readline_has_bash = 1
" Ruby
let ruby_minlines = 500
let ruby_space_errors = 1
" sh
let g:is_bash = 1 "bashしか使わへん
let sh_minlines = 500
" perl
"autocmd BufNewFile *.pl 0r $HOME/repos/rc/template.pl
let perl_fold = 1
" cpp
"autocmd BufNewFile *.cpp 0r $HOME/repos/rc/template.cpp
" php
let php_folding = 1
let php_sql_query=1
let php_htmlInStrings=1

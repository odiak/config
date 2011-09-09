set showmatch
set tabstop=4
set number
set autoindent
set cindent
set shiftwidth=4
set backspace=indent,eol,start
set fileencoding=utf-8
set encoding=utf-8

let g:neocomplcache_enable_at_startup = 1

set number
syntax on

"マウスを有効にする
if has("mouse")
	set mouse=a
endif

"エラー時のベルを抑制
set noerrorbells
set novisualbell

"クリップボードを共有
set clipboard+=unnamed


map :tn :tabnew
map :qr :QuickRun


command!   Mouse call s:Mouse()
command! NoMouse call s:NoMouse()

function s:Mouse()
	if has("mouse")
		set mouse=a
	endif
endfunction

function s:NoMouse()
	if has("mouse")
		set mouse=
	endif
endfunction



command! Key call s:KeyTest()

function s:KeyTest()
	echo getchar()
endfunction



command! Gcc call s:Gcc()

function! s:Gcc()
	w
	let fname=expand("%")
	let command="gcc " . fname . " -o " . fname . ".out 2>&1"
	let res=system(command)
	let y = 121
	let n = 110
	let key = y

	if strlen(res) > 0
		echo res
		echo " "
		echo "continue? [y/n]:"
		let key = getchar()
	endif

	if key == y
		:! `echo % | sed "s/^\([^\/]\)/.\/\1/g"`.out
	endif

endfunction



command! Gpp call s:Gpp()

function! s:Gpp()
	w
	let fname=expand("%")
	let command="g++ " . fname . " -o " . fname . ".out 2>&1"
	let res=system(command)
	let y = 121
	let n = 110
	let key = y

	if strlen(res) > 0
		echo res
		echo " "
		echo "continue? [y/n]:"
		let key = getchar()
	endif

	if key == y
		:! `echo % | sed "s/^\([^\/]\)/.\/\1/g"`.out
	endif

endfunction



command! Python call s:Python()

function! s:Python()
	w
	:! python %
endfunction






inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf


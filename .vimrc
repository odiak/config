if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set tabstop=4
set number
set autoindent
set nocindent
set shiftwidth=4
set backspace=indent,eol,start
set fileencoding=utf-8
set encoding=utf-8
set expandtab
set smarttab
set smartindent
set title
set showtabline=1
set hidden
syntax on
filetype on

noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>
noremap :uf :<C-u>Unite file<CR>
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

nnoremap <C-b> :<C-u>Unite buffer -buffer-name=buffer<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

let g:neocomplcache_enable_at_startup = 1
imap <silent> <C-n> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-n> <Plug>(neocomplcache_snippets_expand)

filetype plugin on

"空行のインデントを削除しないようにする
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

"マウスを有効にする
if has("mouse")
	set mouse=a
endif

"エラー時のベルを抑制
set noerrorbells
set novisualbell

"クリップボードを共有
set clipboard=autoselect,unnamed

"help
helptags ~/.vim/doc

"zen-coding
let g:user_zen_settings = {'indentation': '    '}

let g:AutoClosePairs = {'(': ')', '[': ']', '"': '"', "'": "'", '{': '}'}

let g:closetag_html_style=1
autocmd Filetype html,xml,xsl,htmldjango source ~/.vim/scripts/closetag.vim 

map tn :tabnew
map te :tabedit
map tc :tabclose

command!   Mouse call s:Mouse()
command! NoMouse call s:NoMouse()

"mouse on
function! s:Mouse()
	if has("mouse")
		set mouse=a
	endif
endfunction

"mouse off
function! s:NoMouse()
	if has("mouse")
		set mouse=
	endif
endfunction

"keytest
command! Key call s:KeyTest()

function! s:KeyTest()
	echo getchar()
endfunction

"Rename the file
command! -nargs=1 Rename call s:Rename(<f-args>)

function! s:Rename(fname)
    w
    let oldfile = expand('%:p')
    let dir     = expand('%:p:h')
    let newfile = dir . '/' . a:fname
    let res     = system('mv ' . oldfile . ' ' . newfile . ' 2>&1')
    if strlen(res) > 0
        echo 'Rename was failed.'
    else
        echo ''
        execute ':e ' . newfile
    endif
endfunction


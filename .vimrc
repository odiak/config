if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif


filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt


set whichwrap=b,s,h,l,>,<,[,]
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
set tabpagemax=30
set tags=tags
set nocompatible
syntax on
filetype on


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


"exec.vim
map ex :Exec


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



"if has('mac')
"    function! Pbcopy(type, ...)
"        let reg_save = @@
"        if a:0
"            silent execute "normal! `<" . a:type . "`>y"
"        elseif a:type == 'line'
"            silent execute "normal! '[V']y"
"        elseif a:type == 'block'
"            silent execute "normal! `[\<C-V>`]y"
"        else
"            silent execute "normal! `[v`]y"
"        endif
"        call system('iconv -f utf-8 -t shift-jis | pbcopy', @@)
"        let @@ = reg_save
"    endfunction
"    nnoremap <silent> <Space>y :<C-u>set opfunc=Pbcopy<CR>g@
"    nnoremap <silent> <Space>yy :<C-u>set opfunc=Pbcopy<CR>g@g@
"    vnoremap <silent> <Space>y :<C-u>call Pbcopy(visualmode(), 1)<CR>
"    nnoremap <silent> <Space>p :<C-u>r !pbpaste<CR>
"endif


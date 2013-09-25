filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set helpfile=$VIMRUNTIME/doc/help.txt
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set tabstop=4
set shiftwidth=4
set number
set autoindent
set nocindent
set backspace=indent,eol,start
set fileencoding=utf-8
set encoding=utf-8
set expandtab
set smarttab
set smartindent
set title
set showtabline=1
set hidden
set noerrorbells
set novisualbell
set clipboard=autoselect,unnamed
set wildmenu
set wildmode=full
if has("mouse")
	set mouse=a
endif

syntax on
filetype on
filetype plugin on

let g:NERDTreeWinPos = 'right'
"if has('vim_starting') && expand('%') == ''
"    autocmd VimEnter * NERDTree ./
"endif

augroup vimrc
autocmd! FileType ruby,eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType html,css,javascript,jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
augroup END

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Rakefile set filetype=ruby
autocmd BufNewFile,BufRead config.ru set filetype=ruby

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

"hi Pmenu ctermbg=darkred
"hi PmenuSel ctermbg=red

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif

let g:rsenseUseOmniFunc = 1

if filereadable( expand('~/.vim/opt/rsense-0.3/bin/rsense') )
    let g:rsenseHome = expand('~/.vim/opt/rsense-0.3')
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

"空行のインデントを削除しないようにする
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

"help
helptags ~/.vim/doc

"zen-coding
let g:user_zen_settings = {'indentation': '    '}

if has('python')
    let g:neocomplcache_clang_use_library = 1
    let g:neocomplcache_clang_library_path ='/usr/lib'
    let g:neocomplcache_max_list = 300
    let g:neocomplcache_clang_user_options =
        \ '-I /usr/include' .
        \ '-I /usr/include/c++/4.2.1'
endif


if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

filetype off

execute pathogen#infect()

set autoindent
set backspace=indent,eol,start
set binary noeol
set clipboard=autoselect,unnamed
set colorcolumn=+1
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set helpfile=$VIMRUNTIME/doc/help.txt
set hidden
set list
set listchars=tab:>-,trail:.
set nocindent
set nocompatible
set noerrorbells
set novisualbell
set number
set shiftwidth=4
set showmatch
set showtabline=1
set smartindent
set smarttab
set tabstop=4
set textwidth=80
set title
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set wildmode=full
if has("mouse")
    set mouse=a
endif

syntax on
filetype on
filetype plugin on

autocmd! FileType ruby,eruby,html,css,javascript,coffee,haml,jade,stylus,less,scss setlocal sw=2 ts=2 sts=2
autocmd! FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd! FileType coffee setlocal commentstring=#\ %s sw=2 ts=2 sts=2
autocmd! BufNewFile,BufRead Gemfile set filetype=ruby
autocmd! BufNewFile,BufRead Rakefile set filetype=ruby
autocmd! BufNewFile,BufRead config.ru set filetype=ruby


" [NerdTree]

let g:NERDTreeWinPos = 'right'


" [unite.vim]

" noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
" noremap :ur :<C-u>Unite register -buffer-name=register<CR>
" noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>
" noremap :uf :<C-u>Unite file<CR>
" noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
" noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>
" noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

nnoremap <C-b> :<C-u>Unite buffer -buffer-name=buffer<CR>

let g:unite_enable_start_insert = 1

" nnoremap [unite] <Nop>
" nmap <Leader>f [unite]

" nnoremap [unite]u  :<C-u>Unite -no-split<Space>
" nnoremap <silent> [unite]f :<C-u>Unite file<CR>
" nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir file<CR>
" nnoremap <silent> [unite]r :<C-u>Unite register<CR>

nnoremap <Leader>u  :<C-u>Unite -no-split<Space>
nnoremap <silent> <Leader>f :<C-u>Unite file<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> <Leader>g :<C-u>Unite register<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" [neocomplecache]

let g:neocomplcache_enable_at_startup = 1
imap <silent> <C-n> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-n> <Plug>(neocomplcache_snippets_expand)

"hi Pmenu ctermbg=darkred
"hi PmenuSel ctermbg=red
highlight NonText ctermfg=245
highlight SpecialKey ctermfg=245
"highlight ColorColumn ctermbg=239

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif

if has('python')
    let g:neocomplcache_clang_use_library = 1
    let g:neocomplcache_clang_library_path ='/usr/lib'
    let g:neocomplcache_max_list = 300
    let g:neocomplcache_clang_user_options =
        \ '-I /usr/include' .
        \ '-I /usr/include/c++/4.2.1'
endif


" [rsense]

let g:rsenseUseOmniFunc = 1

if filereadable( expand('~/.vim/opt/rsense-0.3/bin/rsense') )
    let g:rsenseHome = expand('~/.vim/opt/rsense-0.3')
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif
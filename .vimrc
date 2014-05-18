filetype off

execute pathogen#infect()
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

set autoindent
set backspace=indent,eol,start
set binary noeol
set clipboard=autoselect,unnamed
set colorcolumn=+1
set cursorline
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

autocmd! FileType ruby,eruby,html,css,javascript,coffee,haml,jade,stylus,less,scss,slim setlocal sw=2 ts=2 sts=2
autocmd! FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd! FileType coffee setlocal commentstring=#\ %s sw=2 ts=2 sts=2
autocmd! BufNewFile,BufRead Gemfile set filetype=ruby
autocmd! BufNewFile,BufRead Rakefile set filetype=ruby
autocmd! BufNewFile,BufRead config.ru set filetype=ruby


" [unite.vim]

nnoremap <C-b> :<C-u>Unite buffer -buffer-name=buffer<CR>

let g:unite_enable_start_insert = 1

nnoremap <Leader>u  :<C-u>Unite -no-split<Space>
nnoremap <silent> <Leader>f :<C-u>Unite file<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> <Leader>g :<C-u>Unite register<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


highlight NonText ctermfg=245
highlight SpecialKey ctermfg=245

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif


if has('lua')
    NeoBundle 'Shougo/neocomplete'
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
    let g:neocomplete#keyword_patterns.coffee = '[@]\?[$]\?[$]\?\h\w*'
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    NeoBundle 'supermomonga/neocomplete-rsense.vim'
    let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
    let g:rsenseUseOmniFunc = 1
    let g:neocomplete#sources#rsense#home_directory = "/usr/local/Cellar/rsense/0.3/libexec"
endif


if $GOROOT != ''
    set rtp+=$GOROOT/misc/vim
    NeoBundle 'Blackrush/vim-gocode'
endif
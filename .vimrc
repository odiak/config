set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wting/rust.vim'

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
endif

call neobundle#end()

syntax on
filetype on
filetype plugin indent on

NeoBundleCheck


set autoindent
set backspace=indent,eol,start
set binary
set clipboard=autoselect,unnamed
set colorcolumn=81
set cursorline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set helpfile=$VIMRUNTIME/doc/help.txt
set hidden
set incsearch
set ignorecase
set list
set listchars=tab:>\ ,trail:.
set nocindent
set noeol
set noerrorbells
set novisualbell
set number
set ruler
set shiftwidth=4
set showcmd
set showmatch
set showtabline=1
set smartcase
set smartindent
set smarttab
set tabstop=4
" set textwidth=80
set title
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set wildmode=full
set completeopt=menu,preview
if has("mouse")
    set mouse=a
endif

autocmd! FileType ruby,eruby,html,css,javascript,coffee,haml,jade,stylus,less,scss,slim setlocal sw=2 ts=2 sts=2
autocmd! FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd! FileType coffee setlocal commentstring=#\ %s sw=2 ts=2 sts=2
autocmd! BufNewFile,BufRead Gemfile set filetype=ruby
autocmd! BufNewFile,BufRead Rakefile set filetype=ruby
autocmd! BufNewFile,BufRead config.ru set filetype=ruby
autocmd! BufNewFile,BufRead *.go set filetype=go

set background=light
colorscheme solarized

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.svn|vendor/bundle)$'

" [unite.vim]

" nnoremap <C-b> :<C-u>Unite buffer -buffer-name=buffer<CR>

let g:unite_enable_start_insert = 1

nnoremap <Leader>u  :<C-u>Unite -no-split<Space>
nnoremap <silent> <Leader>f :<C-u>Unite file<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> <Leader>g :<C-u>Unite register<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


highlight NonText ctermfg=248
highlight SpecialKey ctermfg=248


if $GOROOT != ''
    set rtp+=$GOROOT/misc/vim
    exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
endif
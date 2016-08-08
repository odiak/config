set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'thinca/vim-quickrun'
Plug 'slim-template/vim-slim'
Plug 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'digitaltoad/vim-jade'
Plug 'altercation/vim-colors-solarized'
Plug 'wting/rust.vim'
Plug 'tyru/restart.vim'
" Plug 'scrooloose/syntastic'
Plug 'Shougo/neomru.vim'
Plug 'TwitVim'
" Plug 'marijnh/tern_for_vim', {
"             \  'build': {
"             \    'others': 'npm install'
"             \  }
"             \}
Plug 'Shougo/vimshell.vim'
" Plug 'cohama/lexima.vim'
Plug 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plug 'terryma/vim-multiple-cursors'

Plug 'wavded/vim-stylus'

Plug 'scrooloose/nerdtree'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'udalov/kotlin-vim'

Plug 'rhysd/vim-crystal'


if has('lua')
    Plug 'Shougo/neocomplete.vim'
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 1

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif

    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    let g:neocomplete#keyword_patterns.coffee = '[@]\?[$]\?[$]\?\h\w*'
    let g:neocomplete#keyword_patterns.javascript = '[$_a-zA-Z][$_a-zA-Z0-9]*'

    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=tern#Complete

    " let g:neocomplete#sources#omni#input_patterns.javascript =
    "             \ '\h\w*\|[^. \t]\.\w*'
    let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
endif

syntax on
filetype on
filetype plugin indent on

call plug#end()

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
set nrformats=hex
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

set modeline
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
" set statusline+=%{fugitive#statusline()}

autocmd! FileType ruby,eruby,html,css,javascript,coffee,haml,jade,stylus,less,scss,slim,yaml,crystal setlocal sw=2 ts=2 sts=2
autocmd! FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd! FileType coffee setlocal commentstring=#\ %s sw=2 ts=2 sts=2
autocmd! BufNewFile,BufRead Gemfile set filetype=ruby
autocmd! BufNewFile,BufRead Rakefile set filetype=ruby
autocmd! BufNewFile,BufRead config.ru set filetype=ruby
autocmd! BufNewFile,BufRead *.go set filetype=go
autocmd! BufNewFile,BufRead *.ruby set filetype=ruby
autocmd! BufNewFile,BufRead *.md set filetype=markdown

set background=light
colorscheme solarized

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.svn|vendor/bundle|node_modules)$'

command! CPCC CtrlPClearCache

" [unite.vim]

" nnoremap <C-b> :<C-u>Unite buffer -buffer-name=buffer<CR>

let g:unite_enable_start_insert = 1

nnoremap <Leader>u  :<C-u>Unite -no-split<Space>
nnoremap <silent> <Leader>f :<C-u>Unite file file/new directory/new<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>d :<C-u>UniteWithBufferDir file file/new directory/new<CR>
nnoremap <silent> <Leader>g :<C-u>Unite register<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


highlight NonText ctermfg=248
highlight SpecialKey ctermfg=248


if $GOROOT != ''
    set rtp+=$GOROOT/misc/vim
    exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
endif


let g:quickrun_config = {
            \   "coffeecompile": {
            \       "command": "coffee",
            \       "cmdopt": "-cpb --no-header"
            \   },
            \   "sasscompile": {
            \       "command": "sass",
            \       "cmdopt": "--scss"
            \   },
            \   "slimcompile": {
            \       "command": "slimrb"
            \   },
            \   "slimcompile_ruby": {
            \       "command": "slimrb",
            \       "cmdopt": "-c"
            \   },
            \   "slimcompile_rails": {
            \       "command": "slimrb",
            \       "cmdopt": "-c --rails"
            \   },
            \   "javascript": {
            \       "command": "node",
            \   },
            \   "javascript/babel": {
            \       "command": "babel-node",
            \   },
            \   "kotlin": {
            \       'exec': [
            \           'kotlinc-jvm %o %s -d %s:p:r.jar -include-runtime',
            \           '%c %s:p:r.jar'
            \       ],
            \       'tempfile': '%{tempname()}.kt',
            \       'hook/sweep/files': ['%S:p:r.jar'],
            \   }
            \}

command! Coffee QuickRun coffeecompile
command! Sass QuickRun sasscompile
command! Scss QuickRun sasscompile
command! Slim QuickRun slimcompile
command! Slimc QuickRun slimcompile_ruby
command! Slimcr QuickRun slimcompile_rails

if !exists('*ReloadRC')
    function! ReloadRC()
        source $MYVIMRC
        if $MYGVIMRC != ''
            source $MYGVIMRC
        endif
    endfunction
    command! ReloadRC call ReloadRC()
endif


" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_scss_checkers = ["sassc"]
" let g:syntastic_html_tidy_ignore_errors=[
"             \ " proprietary attribute \"ng-",
"             \ " proprietary attribute \"v-" ]

" let g:syntastic_ruby_checkers = ['rubocop']
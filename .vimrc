""""""""""
" General
""""""""""
set history=100

filetype plugin on
filetype indent on

set autoread

""""""""""
" UI
""""""""""

" set buffer around cursor
set so=7

set wildmenu

set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/.DS_Store

set ruler

set cmdheight=2

set hidden

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch
set showmatch
set incsearch

set lazyredraw

" for regex
set magic

set showmatch
set mat=2

" remove error bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

""""""""""
" Colors
""""""""""

syntax on

set background=dark
try
    colorscheme solarized
catch
endtry

set encoding=utf8

set ffs=unix,dos,mac

""""""""""
" Undo
""""""""""

set nobackup
set nowb
set noswapfile

""""""""""
" Indents
""""""""""

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set wrap

""""""""""
" Status
""""""""""

set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""
" Mappings
""""""""""

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m`<-2<cr>`>my`<mzgv`yo`z

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg("/")
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre * :call CleanExtraSpaces()

""""""""""
" Helpers
""""""""""

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    endif
    return ''
endfunction


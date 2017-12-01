syntax on

set nocompatible
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set incsearch
set hlsearch
set formatoptions=q
set textwidth=78

filetype plugin on
autocmd BufRead,BufNewFile *.t set filetype=perl 
autocmd BufRead,BufNewFile *.xhtml set filetype=xml

autocmd FileType c,cpp,php,inc,perl,cs :set cindent noautoindent
"autocmd FileType php :let php_folding = 1
"au FileType php syn region myCComment start="/\*" end="\*/"  fold keepend transparent
autocmd FileType php :imap <C-g> GLOBALS['<ESC>/[ ;'\-]\[$=]<CR>i']
autocmd FileType php :set keywordprg="help"
autocmd BufNewFile,BufRead *.php syn region myCComment start="/\*" end="\*/"  fold keepend transparent
autocmd BufNewFile,BufRead *.csv :setlocal formatoptions=roqn

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

set scrolloff=4
set sidescroll=4
" Set vim to use 'short messages'.
set shortmess=a
set showcmd
set report=0
set confirm
set showmatch
set matchpairs=(:),{:},[:],<:>
"set smarttab
"set autoindent
"set smartindent
"set nomodeline
set wildmenu
set wildmode=longest:list
set ttyfast
set lazyredraw

"set backspace=2
set shiftround
set errorformat=%f:%l:%m,\"%f\"\\,\ line\ %l\:\ %m
set nobackup
set writebackup
"set cinoptions=>s,{0,}0,?0,^0,:0,=s,p0,t0,+s,(0,)20,*30
set nostartofline
set notitle
set splitright
set undofile
set undodir=~/.vim_undo

set noerrorbells
set laststatus=2
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump

" lists the chars chosen in listchars
"set list
set listchars=tab:».,trail:·

map <F1> :buffer! 1<enter>
map <F2> :buffer! 2<enter>
map <F3> :buffer! 3<enter>
map <F4> :buffer! 4<enter>
map <F5> :buffer! 5<enter>
map <F6> :buffer! 6<enter>
map <F7> :buffer! 7<enter>
map <F8> :buffer! 8<enter>
map <F9> :buffer! 9<enter>
map <F10> :buffer! 10<enter>
map <F11> :buffer! 11<enter>
map <F12> :buffer! 12<enter>
nmap <C-N> :set invnumber <CR>
map <Up> gk
map <Down> gj
map <C-q> "AY
imap <Up> <C-o>gk
imap <Down> <C-o>gj

" map up,down to right keys in visual mode
vmap <Up> <Up>
vmap <Down> <Down>


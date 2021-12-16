
" Consider:
" https://github.com/junegunn/tmux-complete.vim
" https://github.com/tomtom/tcomment_vim


" Help
"  :perldo s/searchme/replaceme/g
"  :%!perl -pi -e 's/<text>/\n/'

"  when writing searches with /... use ctrl+r, ctrl+w to get the word under the cursor copied to the search terms

"  % jumps to the other part of a () {} []...

"  ctrl+x-ctrl+f for autocomplete filenames
"  ctrl+x-ctrl+u for autocomplete whatever visible inside tmux panel
"
"  if you want to join without inserting spaces, do gJ

"  delete line match abe
"  :g/abe/d

" paste in insert mode
" ctrl+o p (ctrl exits insert mode for one command)
" ctrl-R " (ctrl-R can be used with other registers than ")
"
" Setting stuff in all windows/tabs at once
" :tabdo windo set number


" general options
set tabstop=4
set shiftwidth=4
set noexpandtab
function! Copy() range
    echo system('cat '. expand('%:p') .'| xclip -selection c')
endfunction
let mapleader = ","
map <leader>pb :call Copy()
vnoremap <leader>pb :!xclip -selection c<cr>u
noremap <leader>v o<cr>:set paste<cr>:.!pbpaste<cr>:set nopaste<cr>

" remove default weird nvimm mapping 
unmap Y

let g:plug_url_format = 'git@github.com:%s.git'

call plug#begin()
Plug 'junegunn/vim-plug' " for help text
Plug 'farmergreg/vim-lastplace'
"Plug 'overcache/NeoSolarized' " not in use
"Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/committia.vim' " commit screen stuff
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " for tabularizing on =, do :Tabularize /=
Plug 'tpope/vim-eunuch', { 'on': [ 'SudoEdit', 'SudoWrite', 'Delete', 'Rename', 'Chmod' ] } " :SudoEdit, :SudoWrite, :Delete, :Rename, :Chmod 
"Plug 'chrisbra/SudoEdit.vim'
Plug 'sk1418/Join'
Plug 'blueyed/vim-diminactive'
Plug 'airblade/vim-matchquote' " make % jump between quotes
Plug 'luochen1990/rainbow' " color parentheses in many colors
Plug 'chrisbra/csv.vim'

"XXX is disabled to test performance, please test before just enabling stuff
"Plug 'tpope/vim-sleuth' " auto detect tab/space indent
"XXXPlug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"XXXPlug 'mbbill/undotree'
"XXXPlug 'w0rp/ale'
"XXXPlug 'sheerun/vim-polyglot'
"XXXPlug 'ntpeters/vim-better-whitespace'
"XXXPlug 'editorconfig/editorconfig-vim'
"XXXPlug 'tpope/vim-fugitive'
"XXXPlug 'terryma/vim-multiple-cursors'
"XXXPlug 'cloudhead/neovim-fuzzy'
"XXXPlug 'andymass/vim-matchup'

""Git installed
""Plug '~/.fzf'
""Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" filetype support
Plug 'rhysd/vim-gfm-syntax', { 'for': ['markdown'] } " GitHub Flavored Markdown Syntax Extension for Vim
Plug 'lifepillar/pgsql.vim', { 'for': ['sql'] }
Plug 'Raku/vim-raku', { 'for': ['raku'] }
Plug 'yko/mojo.vim', { 'for': ['html.epl'] }
Plug 'nathanalderson/yang.vim', { 'for': ['yang'] }

"neovim .5 stuff
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'

"Plug 'christoomey/vim-tmux-navigator'
"Plug 'tmux-plugins/vim-tmux'
"Plug 'dpc/vim-smarttabs' " smarttabs causes problems for mojo.vim with o and the like
"Plug 'mileszs/ack.vim' " disabled for now, since fzf.vim provides :Ag

"vim airline cost 100ms+ to start
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"vim jsonpath cost 200ms+ to start
"Plug 'mogelbrod/vim-jsonpath'
call plug#end()

set t_Co=256                        " force vim to use 256 colors
"vim-colors-solarized
set background=light
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"colorscheme solarized
"colorscheme NeoSolarized
let g:neosolarized_contrast = "high"

let g:sudo_no_gui=1

let g:sql_type_default = 'pgsql'

let g:ale_linters = {'perl': ['perl'], 'javascript': ['eslint', 'prettier'], 'python': ['flake8', 'pylint3', 'mypy']}
let g:ale_python_mypy_options = '--ignore-missing-imports'
"let g:ale_fixers = {'python': ['yapf', 'isort']}
"let g:ale_fixers = {'python': ['autopep8', 'yapf', 'isort']}
"let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
" let ale be usable (not too goddam slow)
let g:ale_echo_delay = 500

"airline
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'tmux'

let g:rainbow_active = 1
let g:rainbow_conf = { 'ctermfgs': ['DarkBlue', 'Magenta', 'Red', 'DarkGray', 'DarkGreen', 'DarkYellow'] }

"let g:EditorConfig_verbose = 1
let g:EditorConfig_max_line_indicator = "exceeding"

" disable offscreen match
let g:matchup_matchparen_offscreen = {}

"committia
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map PageDown/Up
    imap <buffer><PageDown> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><PageUp> <Plug>(committia-scroll-diff-up-half)

endfunction

"fzf
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_layout = { 'down': '~40%' }
nnoremap <Tab> :Buffers<CR>
nnoremap <S-Tab> :Files<CR>
"nnoremap <Leader>* :Ag! =expand("<cword>") <CR>
"let mapleader="," (default)
nnoremap <Leader>* :Ag <C-r>=expand('<cword>')<CR><CR>
"fzf#vim#grep(command, [has_column bool], [spec dict], [fullscreen bool])

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

autocmd FileType perl,mason ab P use Data::Printer; Data::Printer::p
autocmd FileType sql set expandtab

" don't indent comments
set indentkeys-=0#
"autocmd BufNewFile,BufReadPost * if &filetype == "python" |  | endif
"autocmd BufNewFile,BufReadPost * if &filetype == "yaml" | set expandtab shiftwidth=2 indentkeys-=0# | endif

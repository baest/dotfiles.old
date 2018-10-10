
" Consider:
" https://github.com/junegunn/tmux-complete.vim
" https://github.com/junegunn/fzf.vim
" https://github.com/tomtom/tcomment_vim
"

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/committia.vim' " commit screen stuff
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular' " for tabularizing on =, do :Tabularize /=
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/SudoEdit.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sk1418/Join'
Plug 'blueyed/vim-diminactive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug '/z/home/mfk/.zplug/repos/junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'farmergreg/vim-lastplace'
call plug#end()

"vim-colors-solarized
let g:solarized_termcolors=256
let g:solarized_contrast="high"  
set background=light
colorscheme solarized

let g:ackprg = 'ag --vimgrep'

let g:sudo_no_gui=1

let g:ale_linters = {'perl': ['perl'], 'javascript': ['eslint', 'prettier'], 'python': ['flake8', 'pylint3', 'mypy']}
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_fixers = {'python': ['yapf', 'isort']}
"let g:ale_fixers = {'python': ['autopep8', 'yapf', 'isort']}
let g:ale_fix_on_save = 1
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

"let g:EditorConfig_verbose = 1
let g:EditorConfig_max_line_indicator = "exceeding"

"ctrlp
"nnoremap <Tab> :CtrlPBuffer<CR>

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

let g:sql_type_default = 'pgsql'

autocmd FileType perl ab P use DDP; p

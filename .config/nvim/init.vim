syntax on

" Load vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

" Vim enhancement plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'kien/ctrlp.vim'

" Language specific plugins
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go'
Plug 'jimenezrick/vimerl'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " needed by phoenix.vim
Plug 'slashmili/alchemist.vim'
" Plug 'lambdatoast/elm.vim'
Plug 'elmcast/elm-vim'

Plug 'sheerun/vim-polyglot'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Add plugins to &runtimepath
call plug#end()

set title     " change the terminal's title

set shell=zsh
set hidden    " hide buffers, don't close them
set ruler
set backspace=2
set shiftwidth=2
set tabstop=2
set smarttab   " make "tab" insert indents instead of tabs at the beginning of a line
set expandtab  " always uses spaces instead of tab characters

set encoding=utf-8 " Necessary to show unicode glyphs

" Search settings
" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" Highlight cursor position
set cursorline
"set cursorcolumn

tnoremap <Leader>e <C-\><C-n>  “ This maps Leader + e to exit terminal mode.

" set background=dark

"let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = '»'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = '«'
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '|'

let g:deoplete#enable_at_startup = 1

let g:polyglot_disabled = ['elm']

let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

" Format on save (not for now, please)
" let g:mix_format_on_save = 1

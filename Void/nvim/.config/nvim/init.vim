set autoindent
filetype indent plugin on

set hlsearch
set ignorecase
set smartcase

syntax enable
set wrap

set number
set noerrorbells
set mouse=a
set title

set confirm

" enable copy-paste from clipboard
set clipboard+=unnamedplus

" custom mapping
inoremap jk <Esc>
cnoremap jk <Esc>

" vim-plug
call plug#begin('~/.config/nvim/plugged')

" coc.nvim requires nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" coc
" coc-clangd requires clangd
let g:coc_global_extensions = ['coc-clangd', 'coc-jedi']

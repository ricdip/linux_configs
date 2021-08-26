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

set termguicolors
set background=dark

" enable copy-paste from clipboard
set clipboard+=unnamedplus

" custom mapping
inoremap jk <Esc>
cnoremap jk <Esc>

"" vim-plug
call plug#begin('~/.config/nvim/plugged')

" coc.nvim requires nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" themes
"Plug 'morhetz/gruvbox'
Plug 'metalelf0/base16-black-metal-scheme'

call plug#end()

"" coc
" coc-clangd requires clangd
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright']

" theme init
"colorscheme gruvbox
colorscheme base16-black-metal-bathory

" theme config
"let g:gruvbox_contrast_dark = "soft"

{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    extraConfig = ''
      " Set leader key (space)
      let mapleader = " "

      " Enable line numbering
      set number         " Show line numbers
      set relativenumber " Show relative line numbers for easier navigation

      " Set tab management
      set expandtab      " Use spaces instead of tabs
      set tabstop=4      " Set tab width to 4 spaces
      set shiftwidth=4   " Set indentation width
      set softtabstop=4  " Use 4 spaces when pressing the tab key

      " Search settings
      set incsearch      " Enable incremental search
      set ignorecase     " Case-insensitive search
      set smartcase      " Case-sensitive search if uppercase letters are used

      " Syntax and colors
      syntax enable       " Enable syntax highlighting
      set background=dark " Use a dark color scheme
      colorscheme default  " Default colors (can be changed to 'desert', 'elflord', etc.)

      " Save and completion settings
      " set autowrite      " Automatically save before executing commands
      set smartindent    " Use smart indentation
      set wildmenu       " Complete commands in command mode with a menu

      " Navigation and file management
      set cursorline     " Highlight the current line
      set nowrap         " Disable line wrapping for long log files
      set scrolloff=8    " Keep 8 lines visible above and below the cursor
      set hlsearch       " Highlight search results
      set wildmode=longest:full,full   " Complete file names more efficiently
      " set backup         " Enable backup for modified files
      " set backupdir=~/.vim/backup  " Set a directory for backup (make sure it exists)
      " set undofile       " Enable persistent undo support
      " set undodir=~/.vim/undodir       " Set a directory for undo (make sure it exists)
      " set directory=~/.vim/swap   " Set a directory for swap files (make sure it exists)

      " Custom key bindings
      " Map 'jk' to exit insert mode and go to normal mode
      inoremap jk <Esc>

      " Navigation between windows (split)
      nnoremap <C-h> <C-w>h  " Move left
      nnoremap <C-j> <C-w>j  " Move down
      nnoremap <C-k> <C-w>k  " Move up
      nnoremap <C-l> <C-w>l  " Move right

      " Quick save and quit
      nnoremap <leader>w :w<CR>   " Save the file
      nnoremap <leader>q :q<CR>   " Quit the file
      nnoremap <leader>x :x<CR>   " Save and quit the file

      " Navigation between tabs
      nnoremap <leader>tn :tabnew<CR>       " Open a new tab
      nnoremap <leader>tp :tabprevious<CR>  " Go to the previous tab
      nnoremap <leader>tt :tabnext<CR>      " Go to the next tab

      " Copy, cut, and paste with clipboard
      nnoremap <leader>y "+y  " Copy to clipboard
      nnoremap <leader>p "+p  " Paste from clipboard
      nnoremap <leader>d "+d  " Cut to clipboard

      " Select all text
      nnoremap <leader>a ggVG  " Select all text

      " Go to the last modification location
      nnoremap <leader>` `   " Go to the last modification

      " Search and replace
      nnoremap <leader>/ /      " Start forward search
      nnoremap <leader>? ?      " Start backward search
      nnoremap <leader>s :%s///g<Left><Left><Left>  " Start global replacement

      " Navigate between open buffers
      nnoremap <leader>b :bnext<CR>      " Go to the next buffer
      nnoremap <leader>B :bprevious<CR>  " Go to the previous buffer

      " Jump between pairs of parentheses
      nnoremap <leader>% %  " Jump between parentheses or brackets
    '';
  };
}

-- Neovim options

-- allow changing buffers even with modifications
vim.opt.hidden = true

-- on command mode, show completion matches in the status bar
vim.opt.wildmenu = true

-- on command mode, expand the longest common match, then all
vim.opt.wildmode = {"longest","full"}

-- show partial commands in the last line of the screen
vim.opt.showcmd = true

-- case insensitive search
vim.opt.ignorecase = true

-- case sensitive if there are capital letters
vim.opt.smartcase = true

-- smart backspace in insert mode
vim.opt.backspace = {"indent","eol","start"}

-- when on a new line, keep same indent as the previous line
vim.opt.autoindent = true

-- display cursor position on last line of screen or in status line
vim.opt.ruler = true

-- ask for save changes
vim.opt.confirm = true

-- visual bell instead of beeping when doing something wrong
vim.opt.visualbell = true

-- enable use of mouse for all modes
vim.opt.mouse = "a"

-- set command window height to 2 lines
vim.opt.cmdheight = 2

-- Show line numbers on left
vim.opt.number = true

-- indentation settings
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- use spaces instead of tabs
vim.opt.expandtab = true

-- use dark colors over lighter ones
vim.opt.background = "dark"

-- use guifg over ctermfg in true-color terminals
vim.opt.termguicolors = true

-- enable Ctrl+C and Ctrl+V from/to system/nvim
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

--  always display the status line
vim.opt.laststatus = 2

-- prefer UNIX line endings
vim.opt.fileformat= "unix"

-- highlight search results
vim.opt.hlsearch = true

-- jump to the first match in real-time
vim.opt.incsearch = true

-- persist undo history across sessions
vim.opt.undofile = true

-- no double spaces with join
vim.opt.joinspaces = false

-- show some invisible characters
vim.opt.list = false

-- stop words being broken on wrap
vim.opt.linebreak = true

-- make gutter wider by default
vim.opt.numberwidth = 5

-- relative line numbers
--vim.opt.relativenumber = true

-- Convert to Lua ?
--vim.opt.nocompatible = true
--vim.opt.nostartofline = true

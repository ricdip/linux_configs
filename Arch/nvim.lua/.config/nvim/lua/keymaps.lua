-- Neovim keymaps
local helper = require("helpers")

local default_opts = {noremap = true, silent = true, expr = false}
local cjk_opts = {
    desc = "Esc from command mode",
    helper.table_unpack(default_opts)
}
local nlw_opts = {
    desc = "Switch to splitted window: +hjkl",
    helper.table_unpack(default_opts)
}
local nlv_opts = {
    desc = "Vertical split window",
    helper.table_unpack(default_opts)
}
local nlo_opts = {
    desc = "Horizontal split window",
    helper.table_unpack(default_opts)
}
local nltab_opts = {
    desc = "Select next buffer",
    helper.table_unpack(default_opts)
}
local nlbd_opts = {
    desc = "Delete current buffer",
    helper.table_unpack(default_opts)
}

-- mapping jk -> Esc in insert mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", default_opts)

-- note: in command mode mappings to <Esc> also run the command, so we use the alternate method for exiting that is Ctrl+C
-- mapping jk -> Esc in command mode
vim.api.nvim_set_keymap("c", "jk", "<C-C>", cjk_opts)

-- better jk navigation when lines wrap in normal mode
vim.api.nvim_set_keymap("n", "j", "gj", default_opts)
vim.api.nvim_set_keymap("n", "k", "gk", default_opts)

-- switch splitted window keymap: Ctrl+W -> <leader>+W
vim.api.nvim_set_keymap("n", "<leader>w", "<C-W>", nlw_opts)

-- split window vertically
vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>:vsplit<cr>", nlv_opts)

-- split window horizontally
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>:split<cr>", nlo_opts)

-- switch to next buffer
vim.api.nvim_set_keymap("n", "<tab>", "<cmd>:bnext<cr>", nltab_opts)

-- delete current buffer
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>:bd<cr>", nlbd_opts)

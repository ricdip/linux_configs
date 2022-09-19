-- Neovim keymaps

local default_opts = {noremap = true, silent = true, expr = false}

-- mapping jk -> Esc in insert mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", default_opts)

-- note: in command mode mappings to <Esc> also run the command, so we use the alternate method for exiting that is Ctrl+C
-- mapping jk -> Esc in command mode
vim.api.nvim_set_keymap("c", "jk", "<C-C>", default_opts)

-- better jk navigation when lines wrap in normal mode
vim.api.nvim_set_keymap("n", "j", "gj", default_opts)
vim.api.nvim_set_keymap("n", "k", "gk", default_opts)

-- switch splitted window keymap: Ctrl+W -> <leader>+W
vim.api.nvim_set_keymap("n", "<leader>w", "<C-W>", default_opts)

-- split window vertically
vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>:vsplit<cr>", default_opts)

-- split window horizontally
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>:split<cr>", default_opts)

-- delete current buffer
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>:bd<cr>", default_opts)


-- tests
-- test: mapping <leader>+g -> exec: echo "hello" in insert mode
--vim.api.nvim_set_keymap("i", "<leader>g", '<cmd>echo "hello"<cr>', {})

-- vim.keymap.set("i", "jk", "<Esc>", default_opts)
-- vim.api.nvim_buf_set_keymap(0, "i", "jk", "<Esc>", default_opts)

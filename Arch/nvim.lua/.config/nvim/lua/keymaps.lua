-- Neovim keymaps

-- vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, expr = false })

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true, expr = false })
-- vim.api.nvim_buf_set_keymap(0, "i", "jk", "<Esc>", { noremap = true, silent = true, expr = false })

-- vim.api.nvim_set_keymap("n", "<leader>g", '<cmd>echo "hello"<cr>', {})

-- helper that checks if plugin 'nvim-tree' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim-tree"

local helper = require("helpers")
if not helper.load(module_name) then
    print("nvim-tree: reload required")
    return
end

local nvimtree = helper.load(module_name)
nvimtree.setup {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {list = {{key = "u", action = "dir_up"}}}
    },
    renderer = {group_empty = true}
}

local nltt_opts = {desc = 'Open/Close NvimTree'}
local nltf_opts = {desc = 'Focus on NvimTree'}
helper.set_keymap('n', '<leader>tt', "<cmd>:NvimTreeToggle<cr>", nltt_opts)
helper.set_keymap('n', '<leader>tf', "<cmd>:NvimTreeFocus<cr>", nltf_opts)

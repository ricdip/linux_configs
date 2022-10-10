-- helper that checks if plugin 'nvim-tree' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim-tree"

local helper = require("helpers")
if not helper.load(module_name) then
  print("nvim-tree: reload required")
  return
end

local nvimtree = helper.load(module_name)
nvimtree.setup {}

local nlt_opts = {desc = 'Open or close NvimTree'}
helper.set_keymap('n', '<leader>t', "<cmd>:NvimTreeToggle<cr>", nlt_opts)

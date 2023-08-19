-- helper that checks if plugin 'telescope' is already installed
-- and only if it is installed, we configure it
local module_name = "telescope"

local helper = require("helpers")
if not helper.load(module_name) then
    print("telescope: reload required")
    return
end

local telescope = helper.load(module_name)
telescope.setup {}

local builtin = require(module_name .. '.builtin')

local nff_opts = {desc = 'Telescope find files'}
local nfg_opts = {desc = 'Telescope live grep'}
local nfb_opts = {desc = 'Telescope buffers'}
local nfh_opts = {desc = 'Telescope help tags'}

helper.set_keymap('n', '<leader>ff', builtin.find_files, nff_opts)
helper.set_keymap('n', '<leader>fg', builtin.live_grep, nfg_opts)
helper.set_keymap('n', '<leader>fb', builtin.buffers, nfb_opts)
helper.set_keymap('n', '<leader>fh', builtin.help_tags, nfh_opts)

-- helper that checks if plugin 'base16-colorscheme' is already installed
-- and only if it is installed, we configure it
local module_name = "base16-colorscheme"

local helper = require("helpers")
if not helper.load(module_name) then
    print("base16-colorscheme: reload required")
    return
end

-- run vimL command to set color scheme
vim.cmd [[ colorscheme base16-black-metal-bathory ]]
-- vim.cmd [[ colorscheme base16-tomorrow-night ]]

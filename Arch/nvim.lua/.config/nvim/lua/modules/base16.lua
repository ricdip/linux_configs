-- helper that checks if plugin 'base16-colorscheme' is already installed
-- and only if it is installed, we configure it
local helper = require("helpers")
if not helper.load("base16-colorscheme") then
  return
end

-- run vimL command to set color scheme
vim.cmd [[ colorscheme base16-black-metal-bathory ]]

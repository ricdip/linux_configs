-- helper that checks if plugin 'base16-colorscheme' is already installed
-- and only is it is installed, we configure it
local helper = require("helpers")
if not helper.load("base16-colorscheme") then
  return
end

vim.cmd [[ colorscheme base16-black-metal-bathory ]]

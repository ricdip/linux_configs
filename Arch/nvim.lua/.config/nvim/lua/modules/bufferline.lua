-- helper that checks if plugin 'bufferline' is already installed
-- and only if it is installed, we configure it
local module_name = "bufferline"

local helper = require("helpers")
if not helper.load(module_name) then
  print("bufferline: reload required")
  return
end

local bufferline = helper.load(module_name)
bufferline.setup {
  options = {
    color_icons = false
  }
}

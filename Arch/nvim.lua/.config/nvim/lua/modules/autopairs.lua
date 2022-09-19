-- helper that checks if plugin 'nvim-autopairs' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim-autopairs"

local helper = require("helpers")
if not helper.load(module_name) then
  print("nvim-autopairs: reload required")
  return
end

local autopairs = helper.load(module_name)
autopairs.setup {}

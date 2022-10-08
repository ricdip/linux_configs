-- helper that checks if plugin 'fidget' is already installed
-- and only if it is installed, we configure it
local module_name = "fidget"

local helper = require("helpers")
if not helper.load(module_name) then
  print("fidget: reload required")
  return
end

local fidget = helper.load(module_name)
fidget.setup {}

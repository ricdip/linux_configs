-- helper that checks if plugin 'gitsigns' is already installed
-- and only if it is installed, we configure it
local module_name = "gitsigns"

local helper = require("helpers")
if not helper.load(module_name) then
    print("gitsigns: reload required")
    return
end

local gitsigns = helper.load(module_name)
gitsigns.setup {}

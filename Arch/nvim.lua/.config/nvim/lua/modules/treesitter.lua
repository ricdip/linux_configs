-- helper that checks if plugin 'nvim-treesitter' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim-treesitter"

local helper = require("helpers")
if not helper.load(module_name) then
  print("nvim-treesitter: reload required")
  return
end

-- local treesitter = helper.load(module_name)
local treesitter_install = helper.load(module_name .. '.install')

treesitter_install.update({ with_sync = true })

-- TODO: setup treesitter

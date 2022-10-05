-- helper that checks if plugin 'nvim-cursorline' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim-cursorline"

local helper = require("helpers")
if not helper.load(module_name) then
  print("nvim-cursorline: reload required")
  return
end

local cursorline = helper.load(module_name)
cursorline.setup {
  cursorline = {
    enable = true,
    timeout = 500,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

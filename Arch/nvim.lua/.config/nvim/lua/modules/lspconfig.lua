-- helper that checks if plugin 'lspconfig' is already installed
-- and only if it is installed, we configure it
local module_name = "lspconfig"

local helper = require("helpers")
if not helper.load(module_name) then
  print("lspconfig: reload required")
  return
end

local lspconfig = helper.load(module_name)

-- TODO: lspconfig config
-- language server clangd: C, C++
lspconfig.clangd.setup {}

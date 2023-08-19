-- helper that checks if plugin 'mason-lspconfig' is already installed
-- and only if it is installed, we configure it
local module_name = "mason-lspconfig"

local helper = require("helpers")
if not helper.load(module_name) then
    print("mason-lspconfig: reload required")
    return
end

local mason_lspconfig = helper.load(module_name)
mason_lspconfig.setup {
    -- a list of servers to automatically install if they're not already installed
    ensure_installed = helper.coding.lsp.language_servers,
    -- whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed
    -- this setting has no relation with the `ensure_installed` setting.
    automatic_installation = false
}

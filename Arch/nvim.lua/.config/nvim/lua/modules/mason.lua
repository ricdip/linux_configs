-- helper that checks if plugin 'mason' is already installed
-- and only if it is installed, we configure it
local module_name = "mason"

local helper = require("helpers")
if not helper.load(module_name) then
    print("mason: reload required")
    return
end

local mason = helper.load(module_name)
mason.setup {
    ui = {
        -- whether to automatically check for new versions when opening the :Mason window
        check_outdated_packages_on_open = true,
        -- the border to use for the UI window. Accepts same border values as |nvim_open_win()|: none, single, ...
        border = "single",
        icons = {
            -- the list icon to use for installed packages
            package_installed = "✓",
            -- the list icon to use for packages that are installing, or queued for installation
            package_pending = "➜",
            -- the list icon to use for packages that are not installed
            package_uninstalled = "✗"
        }
    }
}

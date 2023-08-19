-- helper that checks if plugin 'nvim_comment' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim_comment"

local helper = require("helpers")
if not helper.load(module_name) then
    print("nvim_comment: reload required")
    return
end

local comment = helper.load(module_name)
comment.setup {
    -- normal mode mapping
    line_mapping = "<leader>cl",
    -- visual mode mapping
    operator_mapping = "<leader>cb"
}

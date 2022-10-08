-- helper that checks if plugin 'nvim-treesitter' is already installed
-- and only if it is installed, we configure it
local module_name = "nvim-treesitter"

local helper = require("helpers")
if not helper.load(module_name) then
  print("nvim-treesitter: reload required")
  return
end

local treesitter_install = helper.load(module_name .. '.install')
treesitter_install.update({ with_sync = true })

-- treesitter config setup
local treesitter_config = helper.load(module_name .. '.configs')
treesitter_config.setup {
  -- list of parser names or "all"
  ensure_installed = helper.coding.treesitter.parsers,
  -- install parsers synchronously
  sync_install = true,
  -- auto install missing parsers
  auto_install = true,
  highlight = {
    enable = true,
    -- setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- using this option may slow down your editor, and you may see some duplicate highlights.
    -- instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- TODO: config for indent and incremental_selection ?
}
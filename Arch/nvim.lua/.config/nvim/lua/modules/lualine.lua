-- helper that checks if plugin 'lualine' is already installed
-- and only if it is installed, we configure it
local module_name = "lualine"

local helper = require("helpers")
if not helper.load(module_name) then
  print("lualine: reload required")
  return
end

local lualine = helper.load(module_name)
lualine.setup {
  options = {
    icons_enabled = true,
    -- lualine theme
    --theme = 'auto',
    theme = 'base16',
    component_separators = '',
    section_separators = '',
    -- filetypes to disable lualine for
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    -- if current filetype is in this list it'll
    -- always be drawn as inactive statusline
    -- and the last window will be drawn as active statusline.
    -- for example if you don't want statusline of
    -- your file tree / sidebar window to have active
    -- statusline you can add their filetypes here.
    ignore_focus = {},
    -- when set to true, left sections i.e. 'a','b' and 'c'
    -- can't take over the entire statusline even
    -- if neither of 'x', 'y' or 'z' are present.
    always_divide_middle = true,
    -- enable global statusline (have a single statusline
    -- at bottom of neovim instead of one for  every window).
    -- This feature is only available in neovim 0.7 and higher.
    globalstatus = false,
    -- sets how often lualine should refreash it's contents (in ms)
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

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
    lualine_b = {'branch', 'diff', {
      'diagnostics',
      -- table of diagnostic sources, available sources are:
      -- 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table as such:
      -- { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
      sources = { 'nvim_diagnostic'},
      -- displays diagnostics for the defined severity types
      sections = { 'error', 'warn', 'info', 'hint' },

      diagnostics_color = {
        -- same values as the general color option can be used here.
        error = 'DiagnosticError', -- changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- changes diagnostics' hint color.
      },
      --symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
      colored = true,           -- displays diagnostics status in color if set to true.
      update_in_insert = false, -- update diagnostics in insert mode.
      always_visible = false,   -- show diagnostics even if there are none.
    }},
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

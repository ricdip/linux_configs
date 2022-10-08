-- Scripts that runs AFTER all main Lua scripts
-- (useful to configure installed plugins)
-- (the require instructions are executed in order)

-- base16-colorscheme config
require("modules.base16")

-- nvim-autopairs config
require("modules.autopairs")

-- bufferline config
require("modules.bufferline")

-- gitsigns config
require("modules.gitsigns")

-- nvim_comment config
require("modules.comment")

-- nvim-treesitter config
require("modules.treesitter")

-- which-key config
require("modules.whichkey")

-- nvim-cursorline config
require("modules.cursorline")

-- plugins dependency: mason < mason-lspconfig < lspconfig
-- mason config
require("modules.mason")

-- mason-lspconfig config
require("modules.mason_lspconfig")

-- lspconfig, cmp_nvim_lsp, cmp, luasnip, cmp_luasnip config
require("modules.lspconfig_cmp_luasnip")

-- plugins dependency: lspconfig < fidget
-- fidget config
require("modules.fidget")

-- lualine config
require("modules.lualine")

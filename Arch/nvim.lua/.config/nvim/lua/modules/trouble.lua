-- helper that checks if plugin 'trouble' is already installed
-- and only if it is installed, we configure it
local module_name = "trouble"

local helper = require("helpers")
if not helper.load(module_name) then
  print("trouble: reload required")
  return
end

local trouble = helper.load(module_name)
trouble.setup {}

local default_opts = {silent = true, noremap = true}

local nlxx_opts = {desc = 'Toggle Trouble list', helper.table_unpack(default_opts)}
local nlxw_opts = {desc = 'Trouble workspace diagnostics', helper.table_unpack(default_opts)}
local nlxd_opts = {desc = 'Trouble document diagnostics', helper.table_unpack(default_opts)}
local nlxl_opts = {desc = 'Trouble location list', helper.table_unpack(default_opts)}
local nlxq_opts = {desc = 'Trouble quickfix items', helper.table_unpack(default_opts)}
local ngR_opts = {desc = 'Trouble LSP references', helper.table_unpack(default_opts)}

-- toggle the list
helper.set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", nlxx_opts)

-- workspace diagnostics from the builtin LSP client
helper.set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", nlxw_opts)

-- document diagnostics from the builtin LSP client
helper.set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", nlxd_opts)

-- items from the window's location list
helper.set_keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", nlxl_opts)

-- quickfix items
helper.set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", nlxq_opts)

-- references of the word under the cursor from the builtin LSP client
helper.set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", ngR_opts)

-- set diagnostics colors
helper.set_hl('TroubleTextError', {fg = helper.coding.lsp.diagnostics_colors.error})
helper.set_hl('TroubleTextWarning', {fg = helper.coding.lsp.diagnostics_colors.warn})
helper.set_hl('TroubleTextInformation', {fg = helper.coding.lsp.diagnostics_colors.info})
helper.set_hl('TroubleTextHint', {fg = helper.coding.lsp.diagnostics_colors.hint})

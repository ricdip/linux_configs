-- helper that checks if plugin 'lspsaga' is already installed
-- and only if it is installed, we configure it
local module_name = "lspsaga"

local helper = require("helpers")
if not helper.load(module_name) then
    print("lspsaga: reload required")
    return
end

local lspsaga = helper.load(module_name)
lspsaga.setup()

local default_opts = {silent = true}

local ngh_opts = {desc = 'LSP finder', helper.table_unpack(default_opts)}
local nlca_opts = {desc = 'Code action', helper.table_unpack(default_opts)}
local nlrn_opts = {desc = 'Rename', helper.table_unpack(default_opts)}
local ngd_opts = {desc = 'Peek definition', helper.table_unpack(default_opts)}
local nlcl_opts = {
    desc = 'Show line diagnostics',
    helper.table_unpack(default_opts)
}
local nlcd_opts = {
    desc = 'Show cursor diagnostics',
    helper.table_unpack(default_opts)
}
local nlo_opts = {desc = 'Outline toggle', helper.table_unpack(default_opts)}
local nK_opts = {
    desc = 'Displays hover information',
    helper.table_unpack(default_opts)
}

-- lsp_finder finds the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
helper.set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", ngh_opts)

-- code action
helper.set_keymap({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<cr>",
                  nlca_opts)

-- rename
helper.set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", nlrn_opts)

-- peek definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
helper.set_keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>", ngd_opts)

-- show line diagnostics
helper.set_keymap("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>",
                  nlcl_opts)

-- show cursor diagnostic
helper.set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<cr>",
                  nlcd_opts)

-- diagnostic jump can use `<c-o>` to jump back
helper.set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>",
                  {silent = true})
helper.set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>",
                  {silent = true})

-- only jump to error
helper.set_keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({
        severity = vim.diagnostic.severity.ERROR
    })
end, {silent = true})
helper.set_keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({
        severity = vim.diagnostic.severity.ERROR
    })
end, {silent = true})

-- outline
helper.set_keymap("n", "<leader>o", "<cmd>LSoutlineToggle<cr>", nlo_opts)

-- hover doc
helper.set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", nK_opts)

-- open float terminal
helper.set_keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<cr>",
                  {silent = true})
-- close floaterm
helper.set_keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]],
                  {silent = true})

-- set diagnostics colors
helper.set_hl('DiagnosticError',
              {fg = helper.coding.lsp.diagnostics_colors.error})
helper.set_hl('DiagnosticWarn', {fg = helper.coding.lsp.diagnostics_colors.warn})
helper.set_hl('DiagnosticInfo', {fg = helper.coding.lsp.diagnostics_colors.info})
helper.set_hl('DiagnosticHint', {fg = helper.coding.lsp.diagnostics_colors.hint})

-- helper that checks if plugins 'lspconfig', 'cmp_nvim_lsp', 'cmp_path', 'cmp_buffer', 'cmp_cmdline', 'cmp', 'luasnip', 'cmp_luasnip' are already installed
-- and only they are installed, we configure them
local lspconfig_str = "lspconfig"
local cmp_nvim_lsp_str = "cmp_nvim_lsp"
local cmp_path_str = "cmp_path"
local cmp_buffer_str = "cmp_buffer"
local cmp_cmdline_str = "cmp_cmdline"
local cmp_str = "cmp"
local luasnip_str = "luasnip"
local cmp_luasnip_str = "cmp_luasnip"

local helper = require("helpers")
if not helper.load(lspconfig_str) then
    print("lspconfig: reload required")
    return
end

if not helper.load(cmp_nvim_lsp_str) then
    print("cmp_nvim_lsp: reload required")
    return
end

if not helper.load(cmp_path_str) then
    print("cmp-path: reload required")
    return
end

if not helper.load(cmp_buffer_str) then
    print("cmp-buffer: reload required")
    return
end

if not helper.load(cmp_cmdline_str) then
    print("cmp-cmdline: reload required")
    return
end

if not helper.load(cmp_str) then
    print("cmp: reload required")
    return
end

if not helper.load(luasnip_str) then
    print("luasnip: reload required")
    return
end

if not helper.load(cmp_luasnip_str) then
    print("cmp_luasnip: reload required")
    return
end

local lspconfig = helper.load(lspconfig_str)
local cmp_nvim_lsp = helper.load(cmp_nvim_lsp_str)
local cmp = helper.load(cmp_str)
local luasnip = helper.load(luasnip_str)

-- FIX: borders on LSP window
local windows = require(lspconfig_str .. ".ui.windows")
windows.default_options.border = 'single'

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local bufopts = {noremap = true, silent = true, buffer = bufnr}

    local ngD_opts = {
        desc = 'Jumps to the declaration',
        helper.table_unpack(bufopts)
    }
    -- local ngd_opts = {desc = 'Jumps to the definition', helper.table_unpack(bufopts)}
    -- local nK_opts = {desc = 'Displays hover information', helper.table_unpack(bufopts)}
    local ngi_opts = {
        desc = 'Lists all the implementations',
        helper.table_unpack(bufopts)
    }
    local nCK_opts = {
        desc = 'Displays signature information',
        helper.table_unpack(bufopts)
    }
    local nlD_opts = {
        desc = 'Jumps to the definition of the type',
        helper.table_unpack(bufopts)
    }
    -- local nlrn_opts = {desc = 'Renames all references', helper.table_unpack(bufopts)}
    -- local nlca_opts = {desc = 'Selects an available code action', helper.table_unpack(bufopts)}
    local ngr_opts = {
        desc = 'Lists all references',
        helper.table_unpack(bufopts)
    }
    local nlf_opts = {
        desc = 'Formats using language server clients',
        helper.table_unpack(bufopts)
    }

    -- lspconfig keymaps

    -- jumps to the declaration of the current symbol
    helper.set_keymap('n', 'gD', vim.lsp.buf.declaration, ngD_opts)
    -- jumps to the definition of the current symbol (implemented by Lspsaga)
    -- helper.set_keymap('n', 'gd', vim.lsp.buf.definition, ngd_opts)
    -- displays hover information about symbol under the cursor. Calling the function twice will jump into the floating window (implemented by Lspsaga)
    -- helper.set_keymap('n', 'K', vim.lsp.buf.hover, nK_opts)
    -- lists all the implementations for current symbol
    helper.set_keymap('n', 'gi', vim.lsp.buf.implementation, ngi_opts)
    -- displays signature information about current symbol
    helper.set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, nCK_opts)
    -- jumps to the definition of the type of the current symbol
    helper.set_keymap('n', '<leader>D', vim.lsp.buf.type_definition, nlD_opts)
    -- renames all references to the current symbol (implemented by Lspsaga)
    -- helper.set_keymap('n', '<leader>rn', vim.lsp.buf.rename, nlrn_opts)
    -- selects a code action available at current cursor position (implemented by Lspsaga)
    -- helper.set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, nlca_opts)
    -- lists all references to the current symbol
    helper.set_keymap('n', 'gr', vim.lsp.buf.references, ngr_opts)
    -- formats a buffer using the attached language server clients
    helper.set_keymap('n', '<leader>f',
                      function() vim.lsp.buf.format {async = true} end, nlf_opts)
end

-- add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- deprecated: capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(helper.coding.lsp.language_servers) do
    lspconfig[lsp].setup {capabilities = capabilities, on_attach = on_attach}
end

-- autocomplete setup
cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},

    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    }),

    sources = {
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'path'},
        {name = 'buffer'}
    }
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {
        {name = 'cmdline', option = {ignore_cmds = {'Man', '!'}}}
    })
})

-- Neovim globals
local helper = require("helpers")

-- setting leader = <space>
vim.g.mapleader = " "

-- Treesitter parsers
helper.coding.treesitter.parsers = {
    "python", "c", "cpp", "go", "java", "lua", "bash", "javascript",
    "typescript", "json", "html", "css", "markdown", "markdown_inline",
    "dockerfile", "regex", "rust", "kotlin"
}

-- LSP language servers: Python, C/C++, Go, Java, Lua, Bash, JavaScript/TypeScript, JSON, HTML, CSS, Markdown, Dockerfile, Rust, CMake, Kotlin
helper.coding.lsp.language_servers = {
    "pyright", "clangd", "gopls", "jdtls", "lua_ls", "bashls", "tsserver",
    "jsonls", "html", "cssls", "marksman", "dockerls", "rust_analyzer", "cmake", "kotlin_language_server"
}

-- LSP diagnostics colors
helper.coding.lsp.diagnostics_colors = {
    error = '#db4b4b',
    warn = '#e0af68',
    info = '#0db9d7',
    hint = '#10B981'
}

-- nvim-tree advised settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

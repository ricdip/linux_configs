-- Neovim globals

local helper = require("helpers")

-- setting leader = <space>
vim.g.mapleader = " "

-- Treesitter parsers
helper.coding.treesitter.parsers = {"python", "c", "cpp", "go", "java", "lua", "bash", "javascript", "typescript", "json", "html", "css" , "markdown", "dockerfile", "regex"}

-- LSP language servers: Python, C/C++, Go, Java, Lua, Bash, JavaScript/TypeScript, JSON, HTML, CSS, Markdown, Dockerfile
helper.coding.lsp.language_servers = {"pyright", "clangd", "gopls", "jdtls", "sumneko_lua", "bashls", "tsserver", "jsonls", "html", "cssls", "marksman", "dockerls"}

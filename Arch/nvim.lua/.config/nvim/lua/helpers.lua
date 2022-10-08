-- Helper functions and objects

-- helper table
G = {}


-- Packer helper
G.packer = {}

---- bootstrap will be != nil only if we are installing Packer
G.packer.boostrap = nil

---- path for packer installation
G.packer.path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

---- Packer git repository URL
G.packer.git_repo = "https://github.com/wbthomason/packer.nvim"

---- Packer download function
G.packer.download = function ()
  if vim.fn.empty(vim.fn.glob(G.packer.path)) > 0 then
    ---- bootstrap is equal to the output of system(), so if will be != nil
    G.packer.boostrap = vim.fn.system {
      "git", "clone", "--depth", "1", G.packer.git_repo, G.packer.path
    }
  end
end


-- load module helper
G.load = function (module_name)
  local status, module = pcall(require, module_name)

  if not status then
    return nil
  end

  return module
end


-- print option helper
G.info = function (option)
  local optinfo = vim.api.nvim_get_all_options_info()[option]
  
  if not optinfo then
    return nil
  else
    return vim.inspect(optinfo)
  end
end


-- table of coding related entries
G.coding = {}

---- Treesitter parsers
G.coding.treesitter = {}
G.coding.treesitter.parsers = {"python", "c", "lua"}

---- LSP language servers: Python, C/C++, Lua
G.coding.lsp = {}
G.coding.lsp.language_servers = {"pyright", "clangd", "sumneko_lua"}


return G
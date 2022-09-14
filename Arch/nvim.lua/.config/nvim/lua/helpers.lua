-- Helper functions

G = {}

-- Packer helper
G.packer = {}
G.packer.boostrap = nil
G.packer.path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
G.packer.git_repo = "https://github.com/wbthomason/packer.nvim"
G.packer.download = function ()
  if vim.fn.empty(vim.fn.glob(G.packer.path)) > 0 then
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


return G
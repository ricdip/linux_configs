-- Neovim plugins

-- helper that automatically downloads Packer if not present
local helper = require("helpers")
helper.packer.download()

-- Packed configured as 'opt'
vim.cmd [[ packadd packer.nvim ]]

-- Packer plugins
local packer = require("packer")
packer.startup {
  function (use)
    -- Packer can manage itself (automatic updates)
    use 'wbthomason/packer.nvim'
    -- base16-colorscheme
    use 'rrethy/nvim-base16'
    
    -- if Packer is already installed: download and update plugins
    -- (when we install Packer we have to re-open neovim for installing plugins)
    if helper.packer.boostrap then
      packer.sync()
    end
  end
}
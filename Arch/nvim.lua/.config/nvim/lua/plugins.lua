-- Neovim plugins
-- helper that automatically downloads Packer if not present
local helper = require("helpers")
helper.packer.download()

-- Packed configured as 'opt'
vim.cmd [[ packadd packer.nvim ]]

-- Packer plugins
local packer = require("packer")
packer.startup {
    function(use)
        -- Packer can manage itself (automatic updates)
        use 'wbthomason/packer.nvim'

        -- if this was the first boot of Packer (bootstrap != nil): download plugins for first time
        -- (when we first boot Packer we have to re-open neovim for configuring installed plugins)
        if helper.packer.boostrap then packer.sync() end
    end
}

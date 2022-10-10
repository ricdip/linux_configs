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
    -- nvim-web-devicons
    use 'kyazdani42/nvim-web-devicons'
    -- fzf-native (suggested dependency for telescope)
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    -- base16-colorscheme
    use 'rrethy/nvim-base16'
    -- nvim-autopairs
    use 'windwp/nvim-autopairs'
    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    -- gitsigns
    use 'lewis6991/gitsigns.nvim'
    -- nvim_comment
    use 'terrortylor/nvim-comment'
    -- nvim-treesitter
    use 'nvim-treesitter/nvim-treesitter'
    -- which-key
    use 'folke/which-key.nvim'
    -- nvim-cursorline
    use 'yamatsum/nvim-cursorline'
    -- mason
    use 'williamboman/mason.nvim'
    -- mason-lspconfig
    use 'williamboman/mason-lspconfig.nvim'
    -- lspconfig
    use 'neovim/nvim-lspconfig'
    -- cmp_nvim_lsp
    use 'hrsh7th/cmp-nvim-lsp'
    -- cmp
    use 'hrsh7th/nvim-cmp'
    -- luasnip
    use 'L3MON4D3/LuaSnip'
    -- cmp_luasnip
    use 'saadparwaiz1/cmp_luasnip'
    -- fidget
    use 'j-hui/fidget.nvim'
    -- lualine
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    -- lspsaga
    use {'glepnir/lspsaga.nvim', branch = 'main'}
    -- telescope (dependencies: fd and ripgrep)
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim'}
    -- trouble
    use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- nvim-tree
    use {'nvim-tree/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- if this was the first boot of Packer (bootstrap != nil): download plugins for first time
    -- (when we first boot Packer we have to re-open neovim for configuring installed plugins)
    if helper.packer.boostrap then
      packer.sync()
    end
  end
}
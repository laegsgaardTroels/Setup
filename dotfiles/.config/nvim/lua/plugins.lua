-- :PackerInstall - Install new added plugins.
-- :PackerStatus - List all installed pluigns.
-- :PackerSnapshot - Take a snapshot of your current plugins versions (useful before updating).
-- :PackerUpdate - Update all plugins.
-- :PackerClean - Remove unused plugins.

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	 }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
end)

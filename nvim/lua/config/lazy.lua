local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  {'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons'},
  'navarasu/onedark.nvim',
  'nvim-lualine/lualine.nvim',
  'NeogitOrg/neogit',
  'lewis6991/gitsigns.nvim',
  'numToStr/Comment.nvim',
  'folke/zen-mode.nvim',
  'neovim/nvim-lspconfig',
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip"
}
require('lazy').setup(plugins, {})

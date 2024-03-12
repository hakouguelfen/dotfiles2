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
  'neovim/nvim-lspconfig',
  'navarasu/onedark.nvim',
  'NeogitOrg/neogit',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly'
  },
}

require('lazy').setup(plugins, {})

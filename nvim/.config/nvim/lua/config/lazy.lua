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
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'NeogitOrg/neogit',
  'nvim-tree/nvim-web-devicons',

  -- Colorschemes
  'RRethy/nvim-base16',
  'kyazdani42/nvim-palenight.lua',

  'windwp/nvim-autopairs',
  'nvim-lualine/lualine.nvim',

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly'
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },                -- Optional
      { 'hrsh7th/cmp-path' },                  -- Optional
      { 'L3MON4D3/LuaSnip' },                  -- Required
    }
  }
}
local opts = {}

require('lazy').setup(plugins, opts)

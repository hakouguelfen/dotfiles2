-- Neovim Config
--

vim.g.mapleader = " "
require("core.lsp")
require("core.lazy")

pcall(function() vim.cmd('colorscheme aman') end)

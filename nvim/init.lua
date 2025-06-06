-- README
-- https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations
--
-- replace telescope with fzf

vim.g.mapleader = " "
require("core.lsp")
require("core.lazy")

pcall(function() vim.cmd('colorscheme onedark') end)

-- README
-- https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations
--
-- omni completion + replace telescope with fzf

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config")
pcall(function() vim.cmd('colorscheme onedark') end)

-- README
-- https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations
--
-- omni completion + replace telescope with fzf

vim.g.mapleader = " "
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 0       -- Hide the banner for a cleaner look
vim.g.netrw_liststyle = 3    -- Use tree view (hierarchical directory listing)
vim.g.netrw_browse_split = 4 -- Open files in the previous window
vim.g.netrw_altv = 1         -- Open splits to the right
vim.g.netrw_winsize = 25     -- Set the width of the netrw window (25% of the screen)

require("core.lsp")
require("core.lazy")
pcall(function() vim.cmd('colorscheme onedark') end)

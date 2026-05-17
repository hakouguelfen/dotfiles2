-- Neovim Confir
--
require("vim._core.ui2").enable({})

vim.g.mapleader = " "
require("lsp")
require("plugins")

vim.keymap.set("n", "<leader>tt", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
    pcall(function() vim.cmd('colorscheme ⴼⴰⵡⵜ') end)
  else
    vim.o.background = "dark"
    pcall(function() vim.cmd('colorscheme ⵜⴰⵍⵍⴰⵙⵜ') end)
  end
end, { desc = "Toggle dark/light theme" })


pcall(function() vim.cmd('colorscheme ⴼⴰⵡⵜ') end)

vim.lsp.enable({
  "luals",
  "ts-ls",
  "biome",
  "rust-analyzer",
  "ruff",
  "clangd",
  "bashls"
})

-- Neovim diagnostics
vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

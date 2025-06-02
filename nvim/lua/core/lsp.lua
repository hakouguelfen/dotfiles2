vim.lsp.enable({
  "luals",
  "ts-ls",
  "rust-analyzer",
  "ruff",
  "clangd",
  -- "pyright",
  -- "eslint"
})

-- Neovim diagnostics
vim.diagnostic.config({
  -- virtual_lines = true,
  -- virtual_text = true,
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

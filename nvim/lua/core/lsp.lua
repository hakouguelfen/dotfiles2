vim.lsp.enable({
  "luals",
  "rust-analyzer",
  -- [PYTHON]
  "ruff",
  "ty",
  -- "basedpyright",
  -- [TS]
  "ts-ls",
  "biome",
  "html",
  "emmet",
  --
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

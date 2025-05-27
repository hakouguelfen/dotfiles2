vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
})
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

-- starting from v0.10
vim.diagnostic.config({
 signs = {
   text = {
     [vim.diagnostic.severity.ERROR] = '✘',
     [vim.diagnostic.severity.WARN] = '▲',
     [vim.diagnostic.severity.HINT] = '⚑',
     [vim.diagnostic.severity.INFO] = '»',
   },
 },
})

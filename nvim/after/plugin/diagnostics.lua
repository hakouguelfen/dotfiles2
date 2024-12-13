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

local function sign_define(args)
  vim.fn.sign_define(args.name, {
    texthl = args.name,
    text = args.text,
    numhl = ''
  })
end

sign_define({name = 'DiagnosticSignError', text = '✘'})
sign_define({name = 'DiagnosticSignWarn', text = '▲'})
sign_define({name = 'DiagnosticSignHint', text = '⚑'})
sign_define({name = 'DiagnosticSignInfo', text = '»'})

-- starting from v0.10
--vim.diagnostic.config({
--  signs = {
--    text = {
--      [vim.diagnostic.severity.ERROR] = '✘',
--      [vim.diagnostic.severity.WARN] = '▲',
--      [vim.diagnostic.severity.HINT] = '⚑',
--      [vim.diagnostic.severity.INFO] = '»',
--    },
--  },
--})

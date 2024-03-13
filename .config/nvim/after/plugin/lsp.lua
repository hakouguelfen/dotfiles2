local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"rust_analyzer", "pyright"},
  handlers = {
    default_setup,
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Lsp Actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs)
    end

    bufmap('i', '<C-Space>', '<C-x><C-o>')
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  end,
})

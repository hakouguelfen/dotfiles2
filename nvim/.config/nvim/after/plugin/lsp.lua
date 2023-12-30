local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- ['<Tab>'] = cmp.mapping.scroll_docs(-4),
    -- ['<S-Tab>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

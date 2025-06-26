local bufmap = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs)
end

-- Autocmd to map Tab to Enter in netrw buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<Tab>", "<CR>", { buffer = true, remap = true })
  end,
})

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank({ higroup = 'Visual' })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    bufmap('i', '<C-Space>', function() vim.lsp.completion.get() end)
    bufmap('n', 'K', function() vim.lsp.buf.hover() end)
    bufmap('n', 'gd', function() vim.lsp.buf.definition() end)
    bufmap('n', 'gD', function() vim.lsp.buf.declaration() end)
    bufmap('n', 'gi', function() vim.lsp.buf.implementation() end)
    bufmap('n', 'go', function() vim.lsp.buf.type_definition() end)
    bufmap('n', 'gr', function() vim.lsp.buf.references() end)
    bufmap('n', '<C-k>', function() vim.lsp.buf.signature_help() end)
    bufmap('n', '<leader>cr', function() vim.lsp.buf.rename() end)
    bufmap('n', '<leader>ca', function() vim.lsp.buf.code_action() end)

    -- Auto-format ("lint") on save.
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end

    -- Enabel auto completion
    -- if client:supports_method('textDocument/completion') then
    --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end

    -- Enabel inlay hints
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})

vim.keymap.set('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

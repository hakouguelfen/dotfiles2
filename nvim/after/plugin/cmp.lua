--local function tab_complete()
--  if vim.fn.pumvisible() == 1 then
--    return '<Down>'
--  end
--
--  local c = vim.fn.col('.') - 1
--  local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')
--
--  if is_whitespace then
--    return '<Tab>'
--  end
--
--  local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'
--
--  if lsp_completion then
--    return '<C-x><C-o>'
--  end
--
--  -- suggest words in current buffer
--  return '<C-x><C-n>'
--end
--
--local function tab_prev()
--  if vim.fn.pumvisible() == 1 then
--    return '<Up>'
--  end
--
--  return '<Tab>'
--end
--
--vim.keymap.set('i', '<Tab>', tab_complete, {expr = true})
--vim.keymap.set('i', '<S-Tab>', tab_prev, {expr = true})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

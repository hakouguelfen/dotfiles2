return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback_to_mappings' },
        ['<S-Tab>'] = { 'select_prev', 'fallback_to_mappings' },
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true }
    },
  }
}

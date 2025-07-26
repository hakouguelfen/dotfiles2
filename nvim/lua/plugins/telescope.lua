return {
  'nvim-telescope/telescope.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>sb', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>sp', builtin.live_grep)

    -- vim.keymap.set('n', '<leader>ff', ':term fzf --preview "bat --style=numbers --color=always {}"<CR>')
  end
}

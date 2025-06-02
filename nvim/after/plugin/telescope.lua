local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sb', builtin.live_grep, { desc = '[S]earch current [W]ord' })

-- vim.keymap.set('n', '<leader>ff', ':term fzf --preview "bat --style=numbers --color=always {}"<CR>')

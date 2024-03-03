vim.g.mapleader = " "

-- Insert mode
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')
--vim.keymap.set('i', '<C-E>', '<ESC>A')
--vim.keymap.set('i', '<C-A>', '<ESC>I')

-- Normal mode
vim.keymap.set('n', '<leader>op', ':NvimTreeToggle<cr>')
vim.keymap.set("n", "<leader>gg", ":Neogit<cr>")
vim.keymap.set("n", "<leader>bk", ":bdelete<cr>")
vim.keymap.set("n", "gt", ":bNext<cr>")

-- center page when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- move text up/down
vim.keymap.set("v", 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set("v", 'J', ":m '>+1<CR>gv=gv")

-- don't remove text from clipboard after pasting
vim.keymap.set("x", 'p', "\"_dP")

-- Lsp keymaps
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.keymap.set("n", "<leader>bs", ":w<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- Auto pairs
vim.cmd('inoremap " ""<left>')
vim.cmd("inoremap ' ''<left>")
vim.cmd("inoremap ( ()<left>")
vim.cmd("inoremap [ []<left>")
vim.cmd("inoremap { {}<left>")

vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap <leader>w <C-w>")

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
  end,
})

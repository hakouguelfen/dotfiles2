-- Insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- Normal mode
vim.keymap.set("n", "<leader>op", ":Vexplore<CR>", { silent = true })
vim.keymap.set("n", "<leader>bk", ":bdelete<cr>")
vim.keymap.set("n", "<leader>bs", ":w<CR>")
vim.keymap.set("n", "<leader>rr", ":so% <CR>")
vim.keymap.set("n", "gt", ":bNext<cr>")
vim.keymap.set("n", "gT", ":bprevious<cr>")

-- center page when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- move text up/down
vim.keymap.set("v", 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set("v", 'J', ":m '>+1<CR>gv=gv")

-- don't remove text from clipboard after pasting
vim.keymap.set("x", 'p', "\"_dP")

-- Auto pairs
vim.cmd('inoremap " ""<left>')
vim.cmd("inoremap ' ''<left>")
vim.cmd("inoremap ( ()<left>")
vim.cmd("inoremap [ []<left>")
vim.cmd("inoremap { {}<left>")

vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap <leader>w <C-w>")

-- Auto Comment
vim.keymap.set("v", "<M-;>", "gc", { remap = true, desc = "Comment selected lines" })
-- Show Diagnostics
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- Insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- vim.keymap.set('i', '<Tab>', '<C-n>', { silent = true })
-- vim.keymap.set('i', '<S-Tab>', '<C-p>', { silent = true })
-- vim.keymap.set('i', '<CR>', '<C-y>', { silent = true })


-- Normal mode
-- vim.keymap.set("n", "<leader>op", function()
--   local bufname = vim.api.nvim_buf_get_name(0)
--   if bufname:match("NetrwTreeListing") then
--     vim.cmd("bwipeout")
--     return
--   end
--   vim.cmd("Vexplore .")
-- end, { silent = true, noremap = true })
-- vim.keymap.set("n", "<leader>ff", ":find<space>")

vim.keymap.set("n", "<M-j>", ":cnext<cr>")
vim.keymap.set("n", "<M-k>", ":cprev<cr>")


vim.keymap.set("n", "<leader>op", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>bk", ":bdelete<cr>")
vim.keymap.set("n", "<leader>bs", ":w<CR>")
vim.keymap.set("n", "<leader>rr", ":so% <CR>")
vim.keymap.set("n", "gt", ":bNext<cr>")
vim.keymap.set("n", "gT", ":bprevious<cr>")


-- Fzf
vim.keymap.set('n', '<leader>ff', require("fzf-lua").files, {})
vim.keymap.set('n', '<leader>bb', require("fzf-lua").buffers, {})
vim.keymap.set('n', '<leader>sb', require("fzf-lua").lgrep_curbuf, {})
vim.keymap.set('n', '<leader>sp', require("fzf-lua").live_grep, {})

-- center page when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- move text up/down
vim.keymap.set("v", 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set("v", 'J', ":m '>+1<CR>gv=gv")

-- don't remove text from clipboard after pasting
vim.keymap.set("x", 'p', "\"_dP")
vim.keymap.set("x", "y", [["+y]], { silent = true }) -- Yank to the system clipboard in visual mode

-- Auto Comment
vim.keymap.set("v", "<M-;>", "gc", { remap = true, desc = "Comment selected lines" })

-- Show Diagnostics
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- Git Blame
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<cr>')

-- Auto pairs
--------------------
vim.cmd('inoremap " ""<left>')
vim.cmd("inoremap ' ''<left>")
vim.cmd("inoremap ( ()<left>")
vim.cmd("inoremap [ []<left>")
vim.cmd("inoremap { {}<left>")

vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap <leader>w <C-w>")


vim.keymap.set("i", ")", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  if line:sub(col, col) == ")" then
    -- cursor is before an existing `)`, just move over it
    return "<Right>"
  else
    -- otherwise, insert a literal `)`
    return ")"
  end
end, { expr = true })


vim.keymap.set("i", "<CR>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")

  local before = line:sub(1, col - 1)
  local after = line:sub(col, col)

  -- check for matching pairs
  if (before:sub(-1) == "(" and after == ")") or
      (before:sub(-1) == "{" and after == "}") or
      (before:sub(-1) == "[" and after == "]") then
    return "<CR><ESC>O"
  else
    return "<CR>"
  end
end, { expr = true })


-- local pairs = {
--   ["("] = ")",
--   ["["] = "]",
--   ["{"] = "}",
--   ["'"] = "'",
--   ['"'] = '"',
--   ["`"] = "`",
-- }
--
-- -- opening pair mapping
-- for open, close in pairs(pairs) do
--   vim.keymap.set("i", open, function()
--     return open .. close .. "<Left>"
--   end, { expr = true })
-- end
--
-- -- closing pair mapping (skip if already present)
-- for _, close in pairs(pairs) do
--   vim.keymap.set("i", close, function()
--     local col = vim.fn.col(".")
--     local line = vim.fn.getline(".")
--     if line:sub(col, col) == close then
--       return "<Right>"
--     else
--       return close
--     end
--   end, { expr = true })
-- end

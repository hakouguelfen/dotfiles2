local zen = require("zen-mode")

zen.setup({
  window = {
    backdrop = 0.95, 
    width = 0.85, 
    height = 1, 
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
     list = false, -- disable whitespace characters
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false, 
      showcmd = false, 
      laststatus = 0, 
    },
    gitsigns = { enabled = true }, 
    tmux = { enabled = true }, 
    alacritty = {
      enabled = true,
      font = "14", -- font size
    },
  },
})

vim.keymap.set('n', '<leader>tz', ':ZenMode<cr>')

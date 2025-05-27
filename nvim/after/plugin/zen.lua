local zen = require("zen-mode")

zen.setup({
  window = {
    width = 0.85,
    height = 1,
  },
  plugins = {
    options = {
      showcmd = false, -- disables the command in the last line of the screen
      laststatus = 0, -- turn off the statusline in zen mode
    },
    tmux = { enabled = true },
    gitsigns = { enabled = true },
    alacritty = {
      enabled = true,
      font = "16", -- font size
    },
  },
})

vim.keymap.set('n', '<leader>tz', ':ZenMode<cr>')

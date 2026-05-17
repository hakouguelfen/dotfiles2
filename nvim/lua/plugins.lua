vim.pack.add({
  -- "https://github.com/nvim-treesitter/nvim-treesitter",
  'https://github.com/ibhagwan/fzf-lua',
  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
    opts = {
      numhl = true,
    }
  },
  {
    src = "https://github.com/nvim-tree/nvim-tree.lua",
    enabled = true,
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  }
})


require("fzf-lua").setup({
  winopts = { backdrop = 85 },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept"
    }
  },
})


require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

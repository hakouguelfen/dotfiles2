return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ruff")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ts_ls")
    end
  }
}


return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
        paramType = true,
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      -- diagnostics = {
      --   globals = { 'vim' },
      -- },
    },
  }
}

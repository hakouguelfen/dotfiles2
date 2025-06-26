return {
  cmd = { "biome", "lsp-proxy" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = {
    "astro",
    "css",
    "graphql",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "svelte",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "vue"
  },
  workspace_required = true
}

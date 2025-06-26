local opt          = vim.opt

opt.timeoutlen     = 300
opt.updatetime     = 100
opt.scrolloff      = 4

-- Better editor UI
opt.number         = true
opt.relativenumber = true
opt.cursorline     = true

-- Better editing experience
opt.expandtab      = true
opt.smarttab       = true
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.softtabstop    = -1
opt.autoindent     = true
opt.wrap           = true
opt.list           = true
opt.listchars      = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- Makes neovim and host OS clipboard play nicely with each other
opt.clipboard      = 'unnamedplus'

-- Search behavior
-----------------------------
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = false

-- Undo and backup options
opt.backup         = false
opt.writebackup    = false
opt.swapfile       = false
opt.undofile       = true
opt.history        = 500

-- Better buffer splitting
opt.splitright     = true
opt.splitbelow     = true

-- Statusline
-----------------------------
opt.laststatus     = 3
opt.statusline     = "%!luaeval('Statusline.active()')"
opt.cmdheight      = 0

-- Folding mechanism
-----------------------------
opt.foldexpr       = 'v:lua.vim.lsp.foldexpr()'
opt.fillchars      = { fold = " " }
opt.foldmethod     = "expr"
opt.foldenable     = false
opt.foldlevel      = 99

opt.completeopt    = { 'menu', 'menuone', 'noselect', 'noinsert', 'preview', 'popup' }
opt.shortmess:append('cW')

-- Netrw customisation
-----------------------------
vim.g.netrw_banner       = 0
vim.g.netrw_liststyle    = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv         = 1
vim.g.netrw_altfile      = 1
vim.g.netrw_winsize      = 25
vim.g.netrw_preview      = 1

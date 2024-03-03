local o          = vim.o
local opt        = vim.opt

o.laststatus     = 3

o.termguicolors  = true
o.timeoutlen     = 500
o.updatetime     = 200
o.scrolloff      = 4

-- Better editor UI
o.number         = true
o.numberwidth    = 1
o.relativenumber = false
o.signcolumn     = 'no'
o.cursorline     = true

-- Better editing experience
o.expandtab      = true
o.smarttab       = true
o.cindent        = true
o.autoindent     = true
o.wrap           = true
o.textwidth      = 300
o.tabstop        = 2
o.shiftwidth     = 2
o.softtabstop    = -1 -- If negative, shiftwidth value is used
o.list           = true
o.listchars      = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard      = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase     = true
o.smartcase      = true

-- Undo and backup options
o.backup         = false
o.writebackup    = false
o.undofile       = true
o.swapfile       = false
o.history        = 50

-- Better buffer splitting
o.splitright     = true
o.splitbelow     = true

-----------------------------
-- vim.opt
-- Folding mechanism
-----------------------------
opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99

opt.hlsearch     = false
opt.incsearch    = true

opt.showmode = false
opt.undofile = true


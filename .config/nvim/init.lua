require "config"

pcall(vim.cmd, 'colorscheme base16-onedark')
pcall(vim.cmd, 'highlight Normal guibg=none')


-- Enable transparency
pcall(vim.cmd, [[ hi Normal guibg=NONE ctermbg=NONE ]])
pcall(vim.cmd, [[ hi NonText guibg=NONE ctermbg=NONE ]])
pcall(vim.cmd, [[ hi LineNr guibg=NONE ctermbg=NONE ]])
pcall(vim.cmd, [[ hi VertSplit guibg=NONE ctermbg=NONE ]])
pcall(vim.cmd, [[ hi StatusLine guibg=NONE ctermbg=NONE ]])
pcall(vim.cmd, [[ hi StatusLineNC guibg=NONE ctermbg=NONE ]])


-- vim.opt.fillchars = { fold = " " }
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldenable = false
-- vim.opt.foldlevel = 99
-- g.markdown_folding = 1 -- enable markdown folding

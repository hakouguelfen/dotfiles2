if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "ⵜⴰⵍⵍⴰⵙⵜ"
-- require("ⵜⴰⵍⵍⴰⵙⵜ").setup()
--

local palette = {
  bg   = "NONE",
  fg   = "#e0e0e0",
  none = "NONE",

  menu = {
    bg     = "#343537",
    fg     = "#3b2f2f",
    accent = "#5c6773",
    muted  = "#bfbab0",
  },
  help = {
    hint      = "#5c6773",
    comment   = { bg = "#9CA3AF", fg = "#292524" },
    constant  = "#b56576",
    selection = "#343537",
  },


  -- accents
  purple = "#8a549a",   -- muted purple for @HACK etc
  green  = {
    light = "#1a3d28",
    dark  = "#84af4f",
  },
  blue   = {
    light = "#0e2040",
    dark  = "#0077b6",
  },


  -- Diagnostics
  error      = "#ff6b7a",
  bg_error   = "#2a1218",
  warning    = "#ddb892",
  bg_warning = "#261a00",
  info       = "#58a6ff",
  bg_info    = "#0d1f38",
  hint       = "#7ec8c8",
  bg_hint    = "#0d2220",
}


-- Syntax — all black
local syntax_groups = {
  "Character", "Boolean", "Identifier", "Statement",
  "Conditional", "Repeat", "Label", "Operator",
  "Exception", "PreProc", "Include", "Define", "Macro",
  "PreCondit", "Type", "StorageClass", "Structure", "Typedef", "Special",
  "SpecialChar", "Tag", "Delimiter", "SpecialComment", "Debug", "Underlined",
  "Ignore", "Error", "Todo", "Directory", "Title",
}
for _, group in ipairs(syntax_groups) do
  vim.api.nvim_set_hl(0, group, { fg = palette.fg, bg = palette.none })
end

-- Treesitter (link everything back to Normal)
local ts_groups = {
  "@conditional", "@repeat", "@exception", "@include",
  "@operator", "@character", "@boolean",
  "@type", "@type.builtin", "@type.definition",
  "@method", "@method.call", "@field", "@property",
  "@namespace", "@label", "@tag", "@tag.attribute",
  "@attribute", "@decorator",
  "@text", "@text.strong", "@text.emphasis", "@text.literal",
  "@text.title", "@text.uri", "@text.reference",
  "@constructor", "@annotation",
}
for _, group in ipairs(ts_groups) do
  vim.api.nvim_set_hl(0, group, { link = "Normal" })
end

local highlights = {
  -- ui
  Normal              = { bg = palette.bg, fg = palette.fg },
  Visual              = { bg = palette.help.selection, fg = palette.none },

  NormalFloat         = { bg = palette.menu.bg, fg = palette.fg },
  FloatBorder         = { bg = palette.menu.bg, fg = palette.menu.muted },
  ["@markup.raw"]     = { fg = palette.menu.fg },   -- inline code
  ["@markup.heading"] = { fg = palette.fg, bold = true },
  ["@markup.link"]    = { fg = palette.menu.fg },

  LineNr              = { fg = palette.fg },
  CursorLine          = { bg = palette.bg },
  StatusLine          = { bg = palette.bg },

  FloatTitle          = { bg = palette.menu.bg, fg = palette.menu.accent, bold = true },
  WinSeparator        = { fg = palette.menu.muted },
  Search              = { bg = palette.bg_warning, fg = palette.warning },
  IncSearch           = { bg = palette.warning, fg = palette.bg },
  CursorLineNr        = { fg = palette.menu.accent, bold = true },

  LspInlayHint        = { fg = palette.help.hint, italic = true, bold = true },


  -- Matching elements
  Pmenu                                 = { bg = palette.menu.bg, fg = palette.fg },
  PmenuSel                              = { bg = palette.menu.fg, fg = palette.bg },
  MatchParen                            = { fg = palette.menu.accent, bold = true },

  -- Diagnostics
  DiagnosticVirtualTextError            = { bg = palette.bg_error, fg = palette.error },
  DiagnosticVirtualTextWarn             = { bg = palette.bg_warning, fg = palette.warning },
  DiagnosticVirtualTextInfo             = { bg = palette.bg_info, fg = palette.info },
  DiagnosticVirtualTextHint             = { bg = palette.bg_hint, fg = palette.hint },
  --
  DiagnosticUnderlineError              = { sp = palette.error, undercurl = true, bold = true },
  DiagnosticUnderlineWarn               = { sp = palette.warning, undercurl = true, bold = true },
  DiagnosticUnderlineInfo               = { sp = palette.info, undercurl = true, bold = true },
  DiagnosticUnderlineHint               = { sp = palette.hint, undercurl = true, bold = true },
  --
  DiagnosticSignError                   = { fg = palette.error },
  DiagnosticSignWarn                    = { fg = palette.warning },
  DiagnosticSignInfo                    = { fg = palette.info },
  DiagnosticSignHint                    = { fg = palette.hint },
  --
  DiagnosticError                       = { fg = palette.error },
  DiagnosticWarn                        = { fg = palette.warning },
  DiagnosticInfo                        = { fg = palette.info },
  DiagnosticHint                        = { fg = palette.hint },
  -- Git signs
  GitSignsAdd                           = { fg = palette.green.dark },
  GitSignsChange                        = { fg = palette.warning },
  GitSignsDelete                        = { fg = palette.error },

  -- Highlights NOTE
  ["todo"]                              = { fg = palette.menu.fg, bold = true },
  ["note"]                              = { fg = palette.green.dark, bold = true },
  ["fixme"]                             = { fg = palette.error, bold = true },
  ["hack"]                              = { fg = palette.purple, bold = true },

  ["typescriptBraces"]                  = { fg = palette.menu.accent },
  ["typescriptParens"]                  = { fg = palette.menu.accent },
  ["@punctuation"]                      = { fg = palette.menu.accent },
  ["@punctuation.delimiter"]            = { fg = palette.menu.accent },
  ["@punctuation.bracket"]              = { fg = palette.menu.accent },
  ["@punctuation.special"]              = { fg = palette.menu.accent },

  -- General Syntax --
  --------------------
  String                                = { fg = palette.green.dark, italic = true },
  Number                                = { fg = palette.green.dark },
  ["@string"]                           = { fg = palette.green.dark, italic = true },
  ["@number"]                           = { fg = palette.green.dark },
  Comment                               = { bg = palette.help.comment.bg, fg = palette.help.comment.fg },
  Constant                              = { fg = palette.help.constant, bold = true },
  Keyword                               = { fg = palette.menu.muted },
  -- variables
  ["@variable"]                         = { fg = palette.fg },
  ["@lsp.typemod.variable.declaration"] = { fg = palette.warning, bold = true },
  -- funcitons
  ["@lsp.type.method"]                  = { bg = palette.bg, fg = palette.fg },
  ["@lsp.type.function"]                = { bg = palette.bg, fg = palette.fg },
  ["@function.call"]                    = { bg = palette.bg, fg = palette.fg },
  ["rustFuncCall"]                      = { bg = palette.bg, fg = palette.fg },
  Function                              = { fg = palette.blue.dark, bold = true },
  ["@lsp.typemod.struct.declaration"]   = { fg = palette.blue.dark, bold = true },
  ["@lsp.typemod.method.declaration"]   = { fg = palette.blue.dark, bold = true },
  ["@lsp.typemod.function.declaration"] = { fg = palette.blue.dark, bold = true },
  ["rustFuncName"]                      = { fg = palette.blue.dark, bold = true },

}

vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true, italic = true, bg = palette.bg_hint, fg = palette.hint })
for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

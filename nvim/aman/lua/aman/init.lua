local M = {}

function M.setup()
  local colors = {
    bg = "NONE",
    fg = "#e0e0e0",


    blue = "#0077b6",   -- function
    orange = "#ddb892", -- variable
    green = "#84af4f",  -- strings

    basic = "#bfbab0",
    text_2 = "#b56576", -- constants

    gray = "#5c6773",
    light_gray = "#343537",

    red = "#F45B69",
    purple = "#c678dd",
  }

  local highlights = {
    Normal = { fg = colors.fg, bg = colors.bg },
    LspInlineHints = { fg = colors.gray, italic = true, bold = true },
    LspInlayHint = { fg = colors.gray, italic = true, bold = true },
    Visual = { bg = colors.light_gray },
    LineNr = { fg = colors.gray },
    CursorLine = { bg = colors.light_gray },
    StatusLine = { bg = colors.bg },

    -- Git signs (if using gitsigns)
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.orange },
    GitSignsDelete = { fg = colors.red },

    -- Matching elements
    MatchParen = { fg = colors.orange, bold = true },
    Pmenu = { bg = colors.light_gray, fg = colors.basic },
    PmenuSel = { bg = colors.blue, fg = colors.fg },

    -- Syntax
    Comment = { bg = "#9CA3AF", fg = "#292524" },
    String = { fg = colors.green, italic = true },
    Number = { fg = colors.green },
    Constant = { fg = colors.text_2, bold = true },

    Delimiter = { fg = colors.gray, bold = true },
    Special = { fg = colors.gray, bold = true },

    Function = { fg = colors.blue, bold = true },

    ["@variable"] = { fg = colors.orange },

    keyword = { fg = colors.basic, bold = true },
    Identifier = { fg = colors.basic }, -- slightly darker
    Statement = { fg = colors.basic },
    Type = { fg = colors.basic },

    ["todo"] = { bg = colors.bg, fg = colors.orange, bold = true },
    ["note"] = { bg = colors.bg, fg = colors.green, bold = true },
    ["fixme"] = { bg = colors.bg, fg = colors.red, bold = true },
    ["hack"] = { bg = colors.bg, fg = colors.purple, bold = true },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M

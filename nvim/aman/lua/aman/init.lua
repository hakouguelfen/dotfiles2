local M = {}

function M.setup()
  local colors = {
    bg = "NONE",
    fg = "#e0e0e0",
    red = "#F45B69",
    pink = "#ffb3c6",
    orange = "#FFA07A",
    green = "#84af4f",

    indianRed = "#CD5C5C",
    darkGreen = "#ecf39e",
    brown = "#bc6c25",

    brown1 = "#ede0d4",
    brown2 = "#e6ccb2",
    brown3 = "#ddb892",
    brown4 = "#b08968",
    brown5 = "#7f5539",
    brown6 = "#9c6644",

    light_blue = "#00b4d8",
    blue = "#2c7da0",
    dark_blue = "#01497c",

    text = "#cad2c5",

    whitesmoke = "#B6B09F",
    gray = "#545659",
    light_gray = "#343537",
    black = "#1a1a1a",
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
    Pmenu = { bg = colors.light_gray, fg = colors.text },
    PmenuSel = { bg = colors.dark_blue, fg = colors.fg },


    -- ["@typeParameter"] = { fg = colors.pink },
    --
    -- ["@label"] = { fg = colors.green },
    -- ["@module"] = { fg = colors.green },
    -- ["@attribute"] = { fg = colors.green },
    --
    -- ["@variable"] = { fg = colors.text },
    -- ["@boolean"] = { fg = colors.orange },
    --
    -- ["@punctuation"] = { fg = colors.whitesmoke },
    --
    -- -- Add more semantic highlighting
    -- ["@constructor"] = { fg = colors.light_blue },
    -- ["@constant.builtin"] = { fg = colors.red },
    -- ["@field"] = { fg = colors.text },
    -- ["@property"] = { fg = colors.text },
    -- ["@operator"] = { fg = colors.dark_blue },
    -- ["@keyword.function"] = { fg = colors.dark_blue, bold = true },
    -- ["@keyword.return"] = { fg = colors.red, bold = true },
    -- ["@tag"] = { fg = colors.red },
    -- ["@tag.attribute"] = { fg = colors.orange },

    -- Syntax
    Comment = { fg = colors.gray, italic = true, bold = true },
    Delimiter = { fg = colors.green },
    String = { fg = colors.green },
    Constant = { fg = colors.orange, bold = true },


    Number = { fg = colors.orange },

    Method = { fg = colors.pink },

    Keyword = { fg = colors.brown },
    ["@keyword"] = { fg = colors.brown, bold = true },

    Function = { fg = colors.brown6 },
    Type = { fg = colors.brown3 },
    ["@variable.parameter"] = { fg = colors.brown1 },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M

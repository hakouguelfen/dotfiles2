local mode_info = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  [""] = "V-BLOCK",
  R = "REPLACE",
}
local function mode()
  local current = vim.api.nvim_get_mode().mode
  local info = mode_info[current] or { "UNKNOWN" }
  return string.format("%%#Visual# %s ", info):upper()
end

local function lsp()
  local count = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#Error# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#WarningMsg# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#Comment#󰌵 " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#Identifier# " .. count["info"]
  end
  return errors .. warnings .. hints .. info .. "%#Normal#"
end


Statusline = {}
Statusline.active = function()
  local file_name = "%#Normal# %t"
  local modified = "%#ErrorMsg#%m"
  local filetype = string.format(" %s ", vim.bo.filetype)
  local linecol = "%P %#Visual# %l:%c "

  return table.concat {
    mode(),
    file_name,
    modified,
    lsp(),
    "%=",
    filetype,
    linecol
  }
end

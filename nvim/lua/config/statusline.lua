local mode_info = {
  n = { name = "NORMAL", color = "MiniStatuslineModeNormal" },
  i = { name = "INSERT", color = "MiniStatuslineModeInsert" },
  v = { name = "VISUAL", color = "MiniStatuslineModeVisual" },
  V = { name = "VISUAL LINE", color = "MiniStatuslineModeVisual" },
  [""] = { name = "VISUAL BLOCK", color = "MiniStatuslineModeVisual" },
  c = { name = "COMMAND", color = "MiniStatuslineModeCommand" },
  R = { name = "REPLACE", color = "MiniStatuslineModeReplace" },
}

local function mode()
  local current = vim.api.nvim_get_mode().mode
  local info = mode_info[current] or { name = "UNKNOWN", color = "MiniStatuslineModeOther" }
  return string.format("%%#%s# %s ", info.color, info.name):upper()
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
    errors = " %#LspDiagnosticsDefaultError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsDefaultWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsDefaultHint#󰌵 " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsDefaultInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

Statusline = {}
Statusline.active = function()
  local file_name = "%#Normal#%t"
  local modified = "%#ErrorMsg#%m"

  local filetype = string.format(" %s ", vim.bo.filetype):upper()
  local linecol = "%P %l:%c"

  return table.concat {
    "%#Statusline#",
    mode(),
    "%#Normal# ",
    file_name,
    modified,
    lsp(),
    "%=%#StatusLineExtra#",
    filetype,
    linecol
  }
end


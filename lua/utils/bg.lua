-- utils/highlight.lua
local M = {}

M.clear_bg = function()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "NormalSB",
    "FloatBorder",
    "SignColumn",
    "EndOfBuffer",
    "CursorLine",
    "CursorLineNr",
    "LineNr",
    "Folded",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "TelescopeNormal",
    "TelescopeBorder",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

return M


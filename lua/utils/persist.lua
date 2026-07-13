local M = {}

local state_file = vim.fn.stdpath("state") .. "/colorscheme"

function M.save_colorscheme(name)
  vim.fn.mkdir(vim.fn.stdpath("state"), "p")
  local file = io.open(state_file, "w")
  if file then
    file:write(name)
    file:close()
  end
end

function M.load_colorscheme()
  local file = io.open(state_file, "r")
  if file then
    local name = file:read("*l")
    file:close()
    if name and name ~= "" then
      pcall(vim.cmd.colorscheme, name)
      return
    end
  end
  require("nightingale").load()
end

return M

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Debounced autosave.
-- The old version ran `silent! wall` on *every* TextChanged, so each dd/p/u
-- in normal mode hit the disk and fired BufWritePost -> nvim-lint, gitsigns,
-- LSP didSave and any external file watcher (vite/tsc/etc). On big projects
-- that is the main source of lag. Now we wait until the buffer has been idle
-- for AUTOSAVE_MS and write once.
local AUTOSAVE_MS = 1000
local timer = vim.uv.new_timer()

local function save_all()
  -- don't write while the user is still typing in insert mode
  if vim.fn.mode():match("^[iRc]") then
    timer:start(AUTOSAVE_MS, 0, vim.schedule_wrap(save_all))
    return
  end
  vim.cmd("silent! wall")
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("autosave_debounced", { clear = true }),
  pattern = "*",
  callback = function(ev)
    if not vim.bo[ev.buf].modifiable or vim.bo[ev.buf].buftype ~= "" then
      return
    end
    timer:stop()
    timer:start(AUTOSAVE_MS, 0, vim.schedule_wrap(save_all))
  end,
})

-- Save immediately when leaving a buffer or the terminal loses focus, so the
-- debounce never loses work.
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimLeavePre" }, {
  group = "autosave_debounced",
  pattern = "*",
  callback = function()
    timer:stop()
    vim.cmd("silent! wall")
  end,
})

return {
  {
    "LazyVim/LazyVim",
    init = function()
      local group = vim.api.nvim_create_augroup("LazyWrapDefault", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
        group = group,
        callback = function()
          vim.wo.wrap = true
        end,
      })
    end,
  },
}


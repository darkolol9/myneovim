return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- override LazyVim’s default on_attach behavior
      inlay_hints = {
        enabled = false,
      },
    },
  },
}


-- bootstrap lazy.nvim, LazyVim and your plugins
vim.opt.clipboard = "unnamedplus"
require("config.lazy")

-- //set theme
vim.cmd "colorscheme citruszest"
-- require("tokyonight").load({ style = "night" })

local hl_utils = require("utils.bg")
hl_utils.clear_bg()


return {
  -- nvim-lspconfig for Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Configure TypeScript server (tsserver)
      lspconfig.tsserver.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
          vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
        end,
      })
    end,
  },
  -- mason.nvim to handle external tools like language servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-lspconfig to link Mason-managed LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "tsserver" },
      })
    end,
  },
}

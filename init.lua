-- bootstrap lazy.nvim, LazyVim and your plugins
vim.opt.clipboard = "unnamedplus"
require("config.lazy")
-- require("flash").toggle()
-- console.log(:m '>+1<CR>gv=gv

-- //set theme
-- vim.cmd "colorscheme tokyonight"
require("tokyonight").load({ style = "night" })
print("setting theme")

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
          -- Enable completion
          require("cmp").setup.buffer({ completion = { autocomplete = false } })
          -- Set up some keymaps if desired (for LSP functions)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
          vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
        end,
      })
    end,
  },

  -- nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          autocomplete = false, -- Turn off auto popup on typing
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- Use vsnip (or your snippet engine)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger autocomplete manually
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "lunasnip" },
          { name = "vsnip" },
        },
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

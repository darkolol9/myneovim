-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Clipboard mappings
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy to clipboard
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste from clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy to clipboard in visual mode
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste from clipboard in visual mode
-- Remap Ctrl+Z to undo
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })

-- In your init.lua or a relevant Lua configuration file

-- Mapping for Ctrl + Left Arrow to go to the previous buffer
vim.api.nvim_set_keymap("n", "<C-Left>", ":bprev<CR>", { noremap = true, silent = true })

-- Mapping for Ctrl + Right Arrow to go to the next buffer
vim.api.nvim_set_keymap("n", "<C-Right>", ":bnext<CR>", { noremap = true, silent = true })

-- In your plugins.lua or init.lua

return {
  -- nvim-lspconfig for Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configure TypeScript server (tsserver)
      lspconfig.tsserver.setup({
        on_attach = function(client, bufnr)
          -- Enable completion
          require("cmp").setup.buffer({ completion = { autocomplete = false } })
          -- Set up some keymaps if desired (for LSP functions)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
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
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
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

return {
  "hrsh7th/nvim-cmp",
  version = "v2.*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "mlaursen/vim-react-snippets",
  },
  config = function()
    -- Setup vim-react-snippets
    require("vim-react-snippets").setup({
      -- don't wrap props in Readonly<T>
      readonly_props = false,

      -- use vitest instead of jest
      test_framework = "vitest",

      -- custom testing-library renderer
      test_renderer_path = "@/test-utils",
    })
  end,
}


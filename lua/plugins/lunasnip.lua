return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      -- load vscode snippets (optional)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- add a global snippet (works in any file)
      ls.add_snippets("all", {
        -- s("clg", fmt("console.log({});", { i(1) })),
      })

      ls.add_snippets("javascript", {
        s("clg", fmt("console.log({});", { i(1) })),
      })

      ls.add_snippets("typescript", {
        s("clg", fmt("console.log({});", { i(1) })),
      })

      ls.add_snippets("javascriptreact", {
        s("clg", fmt("console.log({});", { i(1) })),
      })

      ls.add_snippets("typescriptreact", {
        s("clg", fmt("console.log({});", { i(1) })),
      })

      -- Keymaps for expand / jump (works without nvim-cmp)
      -- vim.keymap.set({ "i", "s" }, "<Tab>", function()
      --   if ls.expand_or_jumpable() then
      --     ls.expand_or_jump()
      --   else
      --     -- fall back to normal Tab
      --     return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
      --   end
      -- end, { expr = true, silent = true })
      --
      -- vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      --   if ls.jumpable(-1) then
      --     ls.jump(-1)
      --   else
      --     return vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true)
      --   end
      -- end, { expr = true, silent = true })
    end,
  },
}

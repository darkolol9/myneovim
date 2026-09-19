return {
  {
    "L3MON4D3/LuaSnip",
    -- Keep LazyVim's lazy-loading and opts (the old `config` replaced them
    -- and also loaded friendly-snippets a second time).
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts)

      local s = ls.snippet
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      for _, ft in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
        ls.add_snippets(ft, {
          s("clg", fmt("console.log({});", { i(1) })),
        })
      end
    end,
  },
}

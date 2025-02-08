return {
  {
    "L3MON4D3/LuaSnip", -- Add LuaSnip
    config = function()
      -- Optionally load VSCode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Custom snippets (example)
      local ls = require("luasnip")
      ls.snippets = {
        lua = {
          ls.parser.parse_snippet("fn", "function ${1:name}(${2:args})\n  ${0}\nend"),
          ls.parser.parse_snippet("for", "for ${1:i} = 1, ${2:10} do\n  ${0}\nend"),
          ls.parser.parse_snippet("wawa", "wawa()"),
        },
      }
    end,
  },
}

-- Theme plugins.
--
-- Every theme is lazy-loaded: lazy.nvim loads a plugin automatically the
-- first time `:colorscheme <name>` asks for a scheme from its colors/ dir.
-- Previously five of these had `lazy = false, priority = 1000` and each
-- called `vim.cmd("colorscheme ...")` in config, so startup applied six
-- different colorschemes back to back before the persisted one won.
return {
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "cpea2506/one_monokai.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "Mofiqul/vscode.nvim", lazy = true },
  { "xeind/nightingale.nvim", lazy = true },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      options = {
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    },
  },
  { "olivercederborg/poimandres.nvim", lazy = true, opts = {} },
  { "uloco/bluloco.nvim", lazy = true, dependencies = { "rktjmp/lush.nvim" } },
  { "vague-theme/vague.nvim", lazy = true, opts = {} },
  { "zootedb0t/citruszest.nvim", lazy = true },

  -- Let LazyVim apply the persisted colorscheme exactly once at startup.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("utils.persist").load_colorscheme()
      end,
    },
  },
}

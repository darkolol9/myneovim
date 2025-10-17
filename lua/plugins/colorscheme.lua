return {
  -- Theme plugins
  { "sainnhe/gruvbox-material" },
  { "sainnhe/everforest" },
  { "navarasu/onedark.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  { "folke/tokyonight.nvim" },
  { "cpea2506/one_monokai.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,  -- set true if you want transparent background
          terminal_colors = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })
      vim.cmd("colorscheme terafox")
    end,
  },
  -- Tell LazyVim which colorscheme to use by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

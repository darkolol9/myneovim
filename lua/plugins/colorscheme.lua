return {
  -- Add gruvbox-material theme
  { "sainnhe/gruvbox-material" },
  { "sainnhe/everforest" },
  { "navarasu/onedark.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  { "folke/tokyonight.nvim" },
  { "cpea2506/one_monokai.nvim" },
  -- Configure LazyVim to load gruvbox-material with light background
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one_monokai",
    },
  },
}

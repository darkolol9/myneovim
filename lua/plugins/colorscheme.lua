return {
  -- Add gruvbox-material theme
  { "sainnhe/gruvbox-material" },
  { "sainnhe/everforest" },
  { "navarasu/onedark.nvim" },

  -- Configure LazyVim to load gruvbox-material with light background
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}

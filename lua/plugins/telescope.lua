return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      -- Require Telescope to ensure it's loaded
      local telescope = require("telescope")

      -- Set key mappings after Telescope is loaded
      vim.api.nvim_set_keymap('n', '<Leader><Leader>', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })  -- search in the current directory
      vim.api.nvim_set_keymap('n', '<Leader>fF', '<Cmd>Telescope find_files cwd=~<CR>', { noremap = true, silent = true })  -- search everywhere

      -- You can also call telescope.setup() here to ensure it's configured
      telescope.setup({})
    end
  }
}


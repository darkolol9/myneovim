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
      -- -- Add to your telescope config
      telescope.setup({
        defaults = {
          -- Enable fuzzy matching
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,

          -- Configure fuzzy matching settings
          fuzzy_search = true,
          case_mode = "smart_case",  -- Case sensitivity behavior ("ignore_case", "smart_case", "respect_case")
        },
      })

   end
  }
}


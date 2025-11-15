return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local dv = require("diffview")
    dv.setup()

    -- Existing keymaps
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
    vim.keymap.set("n", "<leader>gD", ":DiffviewClose<CR>", { desc = "Diffview Close" })

    -- New keymap: dynamic diff vs parent branch (all commits + working tree)
    vim.keymap.set("n", "<leader>gH", function()
      -- find upstream branch dynamically
      local handle = io.popen("git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null")
      local upstream = handle:read("*a"):gsub("%s+", "")
      handle:close()

      if upstream == "" then
        print("No upstream branch found")
        return
      end

      -- get merge-base with upstream
      local handle2 = io.popen("git merge-base HEAD " .. upstream)
      local merge_base = handle2:read("*a"):gsub("%s+", "")
      handle2:close()

      -- open Diffview from merge-base to HEAD
      vim.cmd("DiffviewOpen " .. merge_base)
    end, { noremap = true, silent = true, desc = "Diff current branch vs parent branch" })
  end,
}


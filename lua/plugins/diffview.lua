return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- load on first use instead of at startup
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview Open" },
    { "<leader>gD", "<cmd>DiffviewClose<CR>", desc = "Diffview Close" },
    {
      "<leader>gH",
      function()
        -- try upstream branch first
        local upstream = vim.fn.system("git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null"):gsub("%s+", "")

        if upstream == "" then
          -- fallback: try main, then master
          local function branch_exists(branch)
            vim.fn.system("git show-ref --verify --quiet refs/heads/" .. branch)
            return vim.v.shell_error == 0
          end

          if branch_exists("main") then
            upstream = "main"
          elseif branch_exists("master") then
            upstream = "master"
          else
            print("No upstream branch, and neither main nor master exists")
            return
          end
        end

        -- get merge-base with upstream
        local merge_base = vim.fn.system("git merge-base HEAD " .. upstream):gsub("%s+", "")

        -- open Diffview from merge-base to HEAD
        vim.cmd("DiffviewOpen " .. merge_base)
      end,
      desc = "Diff current branch vs parent branch",
    },
  },
  opts = {},
}

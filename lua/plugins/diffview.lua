return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local dv = require("diffview")
    dv.setup()

    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
    vim.keymap.set("n", "<leader>gH", ":DiffviewOpen<CR> HEAD", { desc = "Diffview vs HEAD" })
    vim.keymap.set("n", "<leader>gD", ":DiffviewClose<CR>", { desc = "Diffview Close" })
  end,
}


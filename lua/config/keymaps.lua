-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy to clipboard
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste from clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy to clipboard in visual mode
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste from clipboard in visual mode
-- Remap Ctrl+Z to undo
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })


-- Override the default keymap for cwd wide grep
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })


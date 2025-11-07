-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--

vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy to clipboard
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste from clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy to clipboard in visual mode
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste from clipboard in visual mode
-- Remap Ctrl+Z to undo
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })


-- Swap the current line with the one above it (Alt + Up)
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Swap the current line with the one below it (Alt + Down)
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Swap selected lines with the one above it (Alt + Up in Visual Mode)
vim.api.nvim_set_keymap('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Swap selected lines with the one below it (Alt + Down in Visual Mode)
vim.api.nvim_set_keymap('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })



-- Override the default keymap for cwd wide grep
-- vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<cr>', { noremap = true, silent = true })


-- custom
-- vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>lua Prnt()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "kk", "<cmd>cnext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "jj", "<cmd>cprev<cr>", { noremap = true, silent = true })

-- ctrl A select all baby!
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- tab to switch between tabs! and shift tab to cycle backwards
vim.api.nvim_set_keymap("n", "<tab>", "<cmd>bn<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>bp<cr>", { noremap = true, silent = true })

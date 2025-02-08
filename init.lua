-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Clipboard mappings
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true }) -- Copy to clipboard
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true }) -- Paste from clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true }) -- Copy to clipboard in visual mode
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true }) -- Paste from clipboard in visual mode
-- Remap Ctrl+Z to undo
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })

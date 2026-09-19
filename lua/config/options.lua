-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.autoformat = false

-- Disable snacks animations (smooth scroll, indent scope, notifier fades).
-- They redraw on a timer and are the usual cause of choppy scrolling in a
-- WSL terminal, especially on large files.
vim.g.snacks_animate = false

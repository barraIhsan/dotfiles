-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- when deleting a single character using x, dont store it into clipboard
keymap.set("n", "x", '"_x')

-- disable LazyVim's floating terminal
keymap.del({ "n", "t" }, "<c-_>")
keymap.del({ "n", "t" }, "<c-/>")
keymap.del("n", "<leader>fT")
keymap.del("n", "<leader>ft")

-- use ToggleTerm instead
keymap.set({ "n", "t" }, "<c-_>", "<cmd>ToggleTerm direction=horizontal<cr>")

-- integrate with tmux
keymap.set({ "n", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
keymap.set({ "n", "t" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>")
keymap.set({ "n", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>")
keymap.set({ "n", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>")

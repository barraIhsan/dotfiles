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

-- kitty
keymap.set("n", "<c-j>", ":KittyNavigateDown <CR>")
keymap.set("n", "<c-k>", ":KittyNavigateUp <CR>")
keymap.set("n", "<c-l>", ":KittyNavigateRight <CR>")
keymap.set("n", "<c-h>", ":KittyNavigateLeft <CR>")

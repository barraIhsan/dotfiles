-- set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- clear highlight (nohl) when pressing Esc
keymap.set("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window to the right" })
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window below" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- set the cursor in the middle when doing ctrl-d ctrl-u
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- reselect again in visual mode when indenting
keymap.set("v", ">", ">gv", { desc = "Indent/Shift higlighted lines rightwards" })
keymap.set("v", "<", "<gv", { desc = "Unindent/Shift higlighted lines leftwards" })

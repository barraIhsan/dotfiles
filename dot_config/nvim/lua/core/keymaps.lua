-- set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- clear highlight (nohl) when pressing Esc
keymap.set("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>w|", "<C-w>v", { desc = "Split window to the right" })
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window below" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make window equal size" })
keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Close current window" })
keymap.set("n", "<leader>wx", "<C-w>x", { desc = "Swap current window" })
keymap.set("n", "<leader>wt", "<C-w>T", { desc = "Move window into new tab" })

-- move window
keymap.set("n", "<leader>wh", "<C-w>H", { desc = "Move window to far right" })
keymap.set("n", "<leader>wj", "<C-w>J", { desc = "Move window to far bottom" })
keymap.set("n", "<leader>wk", "<C-w>K", { desc = "Move window to far top" })
keymap.set("n", "<leader>wl", "<C-w>L", { desc = "Move window to far left" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<S-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- set the cursor in the middle when doing ctrl-d ctrl-u
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- reselect again in visual mode when indenting
keymap.set("v", ">", ">gv", { desc = "Indent/Shift higlighted lines rightwards" })
keymap.set("v", "<", "<gv", { desc = "Unindent/Shift higlighted lines leftwards" })

-- toggle inline diagnostics (virtual text)
keymap.set("n", "<leader>xx", function()
  vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end, { desc = "Toggle inline diagnostics (virtual text)" })

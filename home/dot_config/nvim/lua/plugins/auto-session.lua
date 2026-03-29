return {
  "rmagatti/auto-session",
  keys = {
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
  },
  cmd = {
    "AutoSession",
  },
  opts = {
    auto_restore = false,
  },
}

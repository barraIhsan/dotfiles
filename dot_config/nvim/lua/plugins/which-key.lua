return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    require("which-key").add({
      { "<leader>t", group = "Tabs" },
      { "<leader>e", group = "Explore (nvim-tree)" },
      { "<leader>f", group = "Find (telescope)" },
      { "<leader>w", group = "Windows / Workplace" },
      { "<leader>x", group = "Trouble" },
      { "<leader>h", group = "Hunk (gitsigns)" },
    })
  end,
}

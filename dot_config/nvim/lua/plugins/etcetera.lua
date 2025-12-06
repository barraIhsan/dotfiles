return {
  -- improve `vim.ui` interfaces
  {
    "stevearc/dressing.nvim",
    event = "BufReadPre",
    opts = {},
  },
  -- improve quickfix
  {
    "stevearc/quicker.nvim",
    event = "BufReadPre",
    opts = {},
  },
  -- render indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {},
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "tabs",
        always_show_bufferline = false,
        show_close_icon = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
      highlights = require("catppuccin.special.bufferline").get_theme(),
    },
  },
  -- notification
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  -- discord rpc
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    build = ":Cord update",
    opts = {
      display = {
        theme = "catppuccin",
      },
    },
  },
  -- naviate between nvim split and tmux pane
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
}

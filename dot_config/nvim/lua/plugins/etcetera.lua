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
  -- lsp signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      floating_window = false,
      hint_prefix = {
        above = "↙ ", -- when the hint is on the line above the current line
        current = "← ", -- when the hint is on the same line
        below = "↖ ", -- when the hint is on the line below the current line
      },
    },
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
    },
  },
  -- notification
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  -- discord rpc
  {
    "vyfor/cord.nvim",
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
  },
}

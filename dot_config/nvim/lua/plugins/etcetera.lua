return {
  -- improve `vim.ui` interfaces
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- visualize merge conflict marker
  {
    "akinsho/git-conflict.nvim",
    version = "*",
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
  -- solve leetcode problems
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "javascript",
    },
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
      },
    },
  },
  -- discord rpc
  {
    "andweeb/presence.nvim",
    opts = {
      neovim_image_text = "VSCode is bloated.",
    },
  },
  -- naviate between nvim split and tmux pane
  {
    "christoomey/vim-tmux-navigator",
  },
}

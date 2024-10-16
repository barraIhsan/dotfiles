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
  -- rust goodies
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = "rust",
  },
  -- manage rust crates
  {
    "saecki/crates.nvim",
    ft = "toml",
    opts = {
      completion = {
        cmp = {
          enabled = true,
        },
      },
    },
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
  -- render images using kitty or ueberzug
  {
    "3rd/image.nvim",
    config = true,
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
  -- preview markdown on buffer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown", "mdx" },
    opts = {},
  },
  -- preview markdown on browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
  },
  },
  -- mdx support
  {
    "davidmh/mdx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  -- discord rpc
  {
    "andweeb/presence.nvim",
    opts = {
      neovim_image_text = "VSCode is bloated.",
    },
  },
  -- tailwind inline color, and sort
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
  -- naviate between nvim split and tmux pane
  {
    "christoomey/vim-tmux-navigator",
  },
}

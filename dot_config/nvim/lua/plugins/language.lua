return {
  -- configure lua for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
  -- rust goodies
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
  },
  -- manage rust crates
  {
    "saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  -- flutter goodies
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = {
      fvm = true,
    },
  },
  -- latex
  {
    "lervag/vimtex",
    ft = "tex",
  },
  -- mdx support
  {
    "davidmh/mdx.nvim",
    ft = "mdx",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  -- tailwind inline color, and sort
  {
    "luckasRanarison/tailwind-tools.nvim",
    build = ":UpdateRemotePlugins",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- use rounded box for tailwind colors
      document_color = {
        inline_symbol = " ",
      },
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
      vim.fn["mkdp#util#install"]()
    end,
  },
}

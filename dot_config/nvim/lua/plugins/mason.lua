return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- list of lsp for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "ts_ls",
        "eslint",
        "jsonls",
        "yamlls",
        "tailwindcss",
        "astro",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_language_server",
        "pyright",
        "bashls",
        "mdx_analyzer",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- list of formatter and linter for mason to install
      ensure_installed = {
        "prettierd", -- prettierd formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "shfmt", -- sh formatter with bash support
      },
    },
  },
}

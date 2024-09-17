return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
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
      },
    })

    require("mason-tool-installer").setup({
      -- list of formatter and linter for mason to install
      ensure_installed = {
        "prettierd", -- prettierd formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "shfmt", -- sh formatter with bash support
      },
    })
  end,
}

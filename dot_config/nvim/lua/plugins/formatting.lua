return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "isort", "black" },
        html = { "prettierd" },
        astro = { "prettierd", lsp_format = "fallback" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        json = { "jq" },
        yaml = { "yq" },
        sh = { "shfmt" },
        dart = { "dart_format" },
      },
      format_on_save = {
        timeout_ms = 500,
      },
    })
  end,
}

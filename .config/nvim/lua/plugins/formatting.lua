return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "isort", "black" },
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
        -- use lsp's formatting for html and astro
        html = { lsp_format = "prefer" },
        astro = { lsp_format = "prefer" },
      },
      format_on_save = {
        timeout_ms = 500,
      },
    })
  end,
}

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
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
			},
			format_on_save = {
				timeout_ms = 500,
			},
		})
	end,
}
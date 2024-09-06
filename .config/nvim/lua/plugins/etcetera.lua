return {
	-- improve `vim.ui` interfaces
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
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
		ft = "markdown",
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

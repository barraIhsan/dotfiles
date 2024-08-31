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
	-- preview markdown
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
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

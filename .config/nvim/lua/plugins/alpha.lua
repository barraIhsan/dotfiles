return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[　　　 　　/＾>》, -―‐‐＜＾}]],
			[[　　　 　./:::/,≠´::::::ヽ.]],
			[[　　　　/::::〃::::／}::丿ハ]],
			[[　　　./:::::i{l|／　ﾉ／ }::}]],
			[[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
			[[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
			[[　 |:::::::|／}｀ｽ /          /]],
			[[.　|::::::|(_:::つ/  Legion  /　neovim!]],
			[[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰈞  Find files", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fg", "  Find by grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  Restore session for cwd", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "󰅙  Quit Neovim", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}

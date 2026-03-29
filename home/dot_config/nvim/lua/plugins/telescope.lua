return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fs", "<cmd>Telescope builtin<CR>", desc = "Find select telescope" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Find current word" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find by grep" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Find diagnostics" },
    { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Find recent files" },
    { "<leader><leader>", "<cmd>Telescope buffers<CR>", desc = "Find existing buffers" },
  },
  cmd = {
    "Telescope",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "%.git/",
          "%.venv/",
          "node_modules/",
          "__pycache__/",
          "yarn%.lock",
          "pnpm%-lock%.yaml",
          "package%-lock%.json",
          "%.png$",
        },
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    -- use fzf
    require("telescope").load_extension("fzf")
  end,
}

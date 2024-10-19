return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          "yarn%.lock",
          "pnpm%-lock%.yaml",
          "package%-lock%.json",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    require("telescope").load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
    keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find select telescope" })
    keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current word" })
    keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by grep" })
    keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find resume" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
    keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Find recent files" })
    keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
  end,
}

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- navigation
        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")

        -- action
        -- stage & reset
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")

        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

        -- undo & preview hunk
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        -- git blame
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

        -- git diff
        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff this ~")

        -- text objects
        map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = {
        merge_tool = {
          layout = "diff1_plain",
        },
      },
    },
  },
  -- trying to migrate to neogit, still keeping these
  -- 2 plugin for some time.. to get used to neogit
  {
    "tpope/vim-fugitive",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" } },
  },
}

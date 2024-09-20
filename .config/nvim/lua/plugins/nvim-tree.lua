return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 35,
        relativenumber = true,
        number = true,
        side = "right",
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        -- show only the directory name
        root_folder_label = ":t",
        highlight_git = "name",
        -- icons
        icons = {
          glyphs = {
            git = { ignored = "" },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        -- hide .git directory
        -- and node_modules
        custom = { "^.git$", "^node_modules$" },
        -- show file even if the file is ignored by git
        git_ignored = false,
      },
      disable_netrw = true,
      hijack_cursor = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}

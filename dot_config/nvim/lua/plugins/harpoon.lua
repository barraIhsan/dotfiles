return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    -- use telescope
    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    -- ho to open harpoon list normally (reorder & delete marks)
    vim.keymap.set("n", "<leader>ho", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    -- hh to open harpoon list with telescope
    vim.keymap.set("n", "<leader>hh", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
    -- ha to add file into harpoon list
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    -- ctrl alt h and l to navigate next and prev
    vim.keymap.set("n", "<C-A-h>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-A-l>", function()
      harpoon:list():next()
    end)
  end,
}

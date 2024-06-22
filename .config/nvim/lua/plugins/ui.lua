return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      render = "wrapped-compact",
      top_down = false,
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Tab" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icons = false,
      },
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      local helpers = require("incline.helpers")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local buffer = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#44406e",
          }
          return buffer
        end,
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    opts = {
      shell = '"C:/Program Files/Git/usr/bin/zsh.exe"',
      open_mapping = [[<c-_>]],
      insert_mappings = true,
      terminal_mappings = true,
    },
  },
}

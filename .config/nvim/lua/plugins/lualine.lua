return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Override 'encoding': Don't display if encoding is UTF-8.
    local function encoding()
      local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
      return ret
    end

    -- fileformat: Don't display if &ff is unix.
    local function fileformat()
      local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
      return ret
    end

    require("lualine").setup({
      options = {
        -- no seperator
        component_separators = "|",
        section_separators = "",
        -- disable lualine at file explorer pane
        disabled_filetypes = { "NvimTree", "alpha" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
          { "filename", path = 1 },
        },
        lualine_x = { encoding, fileformat },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
          { "filename", path = 1 },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        blink_cmp = true,
      },
      custom_highlights = function(colors)
        return {
          BlinkCmpMenu = { bg = colors.base },
          BlinkCmpMenuBorder = { bg = colors.base, fg = colors.blue },
          BlinkCmpDoc = { bg = colors.base },
          BlinkCmpDocBorder = { bg = colors.base, fg = colors.blue },
        }
      end,
    })
    vim.cmd("colorscheme catppuccin")
  end,
}

return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")
    substitute.setup()

    local keymap = vim.keymap

    keymap.set("n", "s", substitute.operator, { noremap = true })
    keymap.set("n", "ss", substitute.line, { noremap = true })
    keymap.set("n", "S", substitute.eol, { noremap = true })
    keymap.set("x", "s", substitute.visual, { noremap = true })
  end,
}

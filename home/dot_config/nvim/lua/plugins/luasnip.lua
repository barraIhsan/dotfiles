return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local types = require("luasnip.util.types")
    require("luasnip").config.set_config({
      -- enable autosnippets
      enable_autosnippets = true,
      -- add cursor-like placeholder to snippet jump location
      ext_opts = {
        [types.insertNode] = {
          visited = {
            virt_text = { { "|", "Conceal" } },
            virt_text_pos = "inline",
          },
          unvisited = {
            virt_text = { { "|", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
        [types.exitNode] = {
          unvisited = {
            virt_text = { { "|", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
      },
    })

    -- load vscode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load({
      exclude = { "all", "html", "gitcommit" },
    })

    -- load custom snippets
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/luasnip/" } })
  end,
}

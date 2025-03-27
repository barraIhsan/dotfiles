return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip").config.set_config({
      -- enable autosnippets
      enable_autosnippets = true,
    })

    -- load vscode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load({
      exclude = { "all", "html", "gitcommit" },
    })

    -- load custom snippets
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/luasnip/" } })
  end,
}

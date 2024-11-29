return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source text within current buffer
    "hrsh7th/cmp-path", -- source file system paths
    "hrsh7th/cmp-emoji", -- unicode emoji

    -- snippets
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "luckasRanarison/tailwind-tools.nvim", -- tailwind
    "micangl/cmp-vimtex", -- tex
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    luasnip.config.set_config({
      -- enable autosnippets
      enable_autosnippets = true,
    })

    -- load vscode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load({
      exclude = { "html" },
    })

    -- load custom snippets
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/luasnip/" } })

    -- use rounded box for tailwind colors
    require("tailwind-tools").setup({
      document_color = {
        inline_symbol = " ",
      },
    })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- only confirm explicitly selected items
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "n", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "n", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "vimtex" }, -- tex
        { name = "crates" }, -- rust crates
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = "emoji" }, -- unicode emoji
      }),
      -- configure lspkind for vscode-like pictograms in completion menu
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          before = require("tailwind-tools.cmp").lspkind_format,
        }),
      },
    })
  end,
}

return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  build = "cargo build --release",
  dependencies = {
    -- pictograms
    "onsails/lspkind.nvim",
    -- snippets
    "L3MON4D3/LuaSnip",
  },
  opts = {
    -- use luasnip for the snippet
    snippets = { preset = "luasnip" },
    keymap = {
      preset = "enter",
      -- disable C-Space as I use it as my tmux prefix
      ["<C-space>"] = {},
      -- show completion manually using the prev and next keymap
      ["<C-p>"] = { "select_prev", "show", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "show", "fallback_to_mappings" },
    },
    sources = {
      default = {
        "lsp",
        "snippets",
        "buffer",
        "path",
      },
    },
    signature = {
      enabled = true,
      window = {
        show_documentation = true,
      },
    },
    completion = {
      list = {
        selection = {
          -- dont auto select completion
          preselect = false,
          -- dont insert completion before accept
          -- instead use "ghost text", see below
          auto_insert = false,
        },
      },
      ghost_text = {
        enabled = true,
      },
      documentation = {
        -- show documentation on selecting it
        auto_show = true,
        auto_show_delay_ms = 0,
      },
      menu = {
        -- use lspkind
        -- see https://cmp.saghen.dev/recipes.html#nvim-web-devicons-lspkind
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
          },
        },
      },
    },
  },
}

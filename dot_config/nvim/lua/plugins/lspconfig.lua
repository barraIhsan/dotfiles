return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    "b0o/schemastore.nvim",
  },
  config = function()
    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        -- buffer local mappings
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        -- show definition, references
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        -- go to declaration
        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        -- show lsp definitions
        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        -- show lsp implementations
        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        -- show lsp type definitions
        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        -- see available code actions
        opts.desc = "Show available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        -- smart rename
        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- show diagnostics
        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        -- show diagnostics for line
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        -- jump to previous diagnostic in buffer
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        -- jump to next diagnostic in buffer
        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        -- show documentation for what is under cursor
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- mapping to restart lsp if necessary
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- enable snippet
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- change diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- enable inlay hint
    vim.lsp.inlay_hint.enable(true, { 0 })

    -- enable borders
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.diagnostic.config({
      float = { border = "rounded", prefix = "", header = "", severity_sort = true, source = true },
    })

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
      -- default handler for installed server
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["svelte"] = function()
        -- configure svelte language server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["html"] = function()
        -- configure html language server
        lspconfig["html"].setup({
          capabilities = capabilities,
          settings = {
            html = {
              format = {
                wrapLineLength = 0,
              },
            },
          },
        })
      end,
      ["cssls"] = function()
        -- configure css langauge server (and ignore unknownAtRules)
        lspconfig["cssls"].setup({
          capabilities = capabilities,
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        })
      end,
      ["jsonls"] = function()
        -- configure json language server (schemastore)
        lspconfig["jsonls"].setup({
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}

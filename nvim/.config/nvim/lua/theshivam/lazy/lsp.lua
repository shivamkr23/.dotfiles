return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-jdtls",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("mason").setup()
        local lspconfig = require('lspconfig')

        lspconfig.pyright.setup({
            capabilities = capabilities,
        })
        lspconfig.ruff_lsp.setup({
            capabilities = capabilities,
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.tsserver.setup({
            capabilities = capabilities,
        })
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })
        lspconfig.gopls.setup({
            capabilities = capabilities,
        })
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })
        lspconfig.jsonls.setup({
            capabilities = capabilities,
        })
        lspconfig.bashls.setup({
            capabilities = capabilities,
        })
        lspconfig.angularls.setup({
            capabilities = capabilities,
        })
        lspconfig.kotlin_language_server.setup({
            capabilities = capabilities,
        })
        lspconfig.svelte.setup({
            capabilities = capabilities,
        })
        lspconfig.volar.setup({
            capabilities = capabilities,
        })
        lspconfig.emmet_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.ruby_lsp.setup({
            capabilities = capabilities,
        })
        lspconfig.vimls.setup({
            capabilities = capabilities,
        })
        lspconfig.yamlls.setup({
            capabilities = capabilities,
        })
        lspconfig.intelephense.setup({
            capabilities = capabilities,
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

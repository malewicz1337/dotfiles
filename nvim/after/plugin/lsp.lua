local lsp_zero = require('lsp-zero')
local lspconfig = require("lspconfig")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'tsserver', 'rust_analyzer', 'tailwindcss', 'svelte', 'sqls', 'pylsp', 'markdown_oxide', 'lua_ls', 'jsonls', 'html', 'grammarly', 'gopls', 'eslint', 'dockerls', 'docker_compose_language_service', 'cssls', 'cssmodules_ls', 'clangd', 'bashls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
    -- default handler for installed servers
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,
    ["svelte"] = function()
        -- configure svelte server
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
    ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
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
    ["pylsp"] = function()
        lspconfig["pylsp"].setup({
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "E501", "W503", "E203" },
                            maxLineLength = 120
                        }
                    }
                }
            }
        })
    end,
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

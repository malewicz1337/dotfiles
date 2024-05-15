local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

mason_lspconfig.setup_handlers({
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
				if client.name == "svelte" then
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts", "*.svelte" },
						callback = function(ctx)
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end,
					})
				end
				if vim.bo[bufnr].filetype == "svelte" then
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts", "*.svelte" },
						callback = function(ctx)
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end,
					})
				end
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
							maxLineLength = 120,
						},
					},
				},
			},
		})
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"stevearc/conform.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"j-hui/fidget.nvim",
			"onsails/lspkind.nvim",
		},

		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "golines", "goimports", "gofmt" },
					rust = { "rustfmt", lsp_format = "fallback" },
					cs = { "csharpier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})
			require("conform.formatters").golines = {
				prepend_args = { "-m", "80", "-w" },
			}

			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			require("fidget").setup({})
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"codelldb",
					"prettier",
					"eslint_d",
					"stylua",
					"stylelint",
					"csharpier",
					"golines",
					"golangci-lint",
				},
			})

			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"gopls",
					"ts_ls",
					"tailwindcss",
					"svelte",
					"zls",
					"omnisharp",
					"dockerls",
					"docker_compose_language_service",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					omnisharp = function()
						local pid = vim.fn.getpid()
						require("lspconfig").omnisharp.setup({
							capabilities = capabilities,
							cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
						})
					end,

					gopls = function()
						require("lspconfig").gopls.setup({
							settings = {
								gopls = {
									analyses = {
										unusedparams = true,
									},
									staticcheck = true,
									usePlaceholders = true,
									completeUnimported = true,
								},
							},
						})
					end,
					zls = function()
						local lspconfig = require("lspconfig")
						lspconfig.zls.setup({
							root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
							settings = {
								zls = {
									enable_inlay_hints = true,
									warn_style = true,
								},
							},
						})
						vim.g.zig_fmt_parse_errors = 0
						vim.g.zig_fmt_autosave = 0
					end,
					lua_ls = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = { version = "Lua 5.1" },
									diagnostics = {
										globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
									},
								},
							},
						})
					end,
					rust_analyzer = function() end,
					svelte = function()
						local lspconfig = require("lspconfig")
						lspconfig["svelte"].setup({
							capabilities = capabilities,
							on_attach = function(client)
								vim.api.nvim_create_autocmd("BufWritePost", {
									pattern = { "*.js", "*.ts" },
									callback = function(ctx)
										client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
									end,
								})
							end,
						})
					end,
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					expandable_indicator = true,
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.api.nvim_buf_set_option(ev.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
					local opts = { buffer = ev.buf, silent = true, noremap = true }

					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				end,
			})

			vim.diagnostic.config({
				update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})
		end,
	},
}

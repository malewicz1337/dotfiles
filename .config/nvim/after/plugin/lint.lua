local lint = require("lint")
lint.linters_by_ft = {
	markdown = { "markdownlint", "vale" },
	-- javascript = { "eslint_d" },
	-- typescript = { "eslint_d" },
	-- javascriptreact = { "eslint_d" },
	-- typescriptreact = { "eslint_d" },
	-- svelte = { "eslint_d" },
	-- vue = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end)

local util = require("lspconfig.util")
local lsp = vim.lsp

local function fix_all(opts)
	opts = opts or {}

	local eslint_lsp_client = util.get_active_client_by_name(opts.bufnr, "eslint")
	if eslint_lsp_client == nil then
		return
	end

	local request
	if opts.sync then
		request = function(bufnr, method, params)
			eslint_lsp_client.request_sync(method, params, nil, bufnr)
		end
	else
		request = function(bufnr, method, params)
			eslint_lsp_client.request(method, params, nil, bufnr)
		end
	end

	local bufnr = util.validate_bufnr(opts.bufnr or 0)
	request(0, "workspace/executeCommand", {
		command = "eslint.applyAllFixes",
		arguments = {
			{
				uri = vim.uri_from_bufnr(bufnr),
				version = lsp.util.buf_versions[bufnr],
			},
		},
	})
end

local root_file = {
	".eslintrc",
	".eslintrc.js",
	".eslintrc.cjs",
	".eslintrc.yaml",
	".eslintrc.yml",
	".eslintrc.json",
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
	"eslint.config.ts",
	"eslint.config.mts",
	"eslint.config.cts",
}

return {
	default_config = {
		cmd = { "vscode-eslint-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
			"svelte",
			"astro",
		},
		root_dir = function(fname)
			root_file = util.insert_package_json(root_file, "eslintConfig", fname)
			return util.root_pattern(unpack(root_file))(fname)
		end,
		settings = {
			validate = "on",
			packageManager = nil,
			useESLintClass = false,
			experimental = {
				useFlatConfig = false,
			},
			codeActionOnSave = {
				enable = false,
				mode = "all",
			},
			format = true,
			quiet = false,
			onIgnoredFiles = "off",
			rulesCustomizations = {},
			run = "onType",
			problems = {
				shortenToSingleLine = false,
			},
			workingDirectory = { mode = "location" },
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine",
				},
				showDocumentation = {
					enable = true,
				},
			},
		},
		on_new_config = function(config, new_root_dir)
			config.settings.workspaceFolder = {
				uri = new_root_dir,
				name = vim.fn.fnamemodify(new_root_dir, ":t"),
			}

			if
				vim.fn.filereadable(new_root_dir .. "/eslint.config.js") == 1
				or vim.fn.filereadable(new_root_dir .. "/eslint.config.mjs") == 1
				or vim.fn.filereadable(new_root_dir .. "/eslint.config.cjs") == 1
				or vim.fn.filereadable(new_root_dir .. "/eslint.config.ts") == 1
				or vim.fn.filereadable(new_root_dir .. "/eslint.config.mts") == 1
				or vim.fn.filereadable(new_root_dir .. "/eslint.config.cts") == 1
			then
				config.settings.experimental.useFlatConfig = true
			end

			local pnp_cjs = util.path.join(new_root_dir, ".pnp.cjs")
			local pnp_js = util.path.join(new_root_dir, ".pnp.js")
			if util.path.exists(pnp_cjs) or util.path.exists(pnp_js) then
				config.cmd = vim.list_extend({ "yarn", "exec" }, config.cmd)
			end
		end,
		handlers = {
			["eslint/openDoc"] = function(_, result)
				if not result then
					return
				end
				local sysname = vim.loop.os_uname().sysname
				if sysname:match("Windows") then
					os.execute(string.format("start %q", result.url))
				elseif sysname:match("Linux") then
					os.execute(string.format("xdg-open %q", result.url))
				else
					os.execute(string.format("open %q", result.url))
				end
				return {}
			end,
			["eslint/confirmESLintExecution"] = function(_, result)
				if not result then
					return
				end
				return 4 -- approved
			end,
			["eslint/probeFailed"] = function()
				vim.notify("[lspconfig] ESLint probe failed.", vim.log.levels.WARN)
				return {}
			end,
			["eslint/noLibrary"] = function()
				vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
				return {}
			end,
		},
	},
	commands = {
		EslintFixAll = {
			function()
				fix_all({ sync = true, bufnr = 0 })
			end,
			description = "Fix all eslint problems for this buffer",
		},
	},
}

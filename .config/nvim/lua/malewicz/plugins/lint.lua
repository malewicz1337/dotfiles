return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- lint.linters.pylint = {
		-- 	name = "pylint",
		-- 	cmd = "pylint",
		-- 	args = {
		-- 		"--disable=C0103,C0111,E0401,W1203",
		-- 		"--output-format=text",
		-- 		'--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
		-- 	},
		-- 	stdin = false,
		-- 	parser = require("lint.parser").from_errorformat("%f:%l:%c:%t: %m", { source = "pylint" }),
		-- 	exec_timeout = 5000,
		-- }

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			-- python = { "pylint" },
			-- markdown = { "markdownlint" },
			vue = { "eslint_d" },
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
		end, { desc = "Trigger linting for current file" })
	end,
}

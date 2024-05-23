local lint = require("lint")

lint.linters_by_ft = {
	markdown = { "vale" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	vue = { "eslint_d" },
	python = { "ruff" },
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

-- Function to check if a file exists
local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	else
		return false
	end
end

-- Function to check for ESLint configuration
local function eslint_config_exists()
	return file_exists(".eslintrc.js")
		or file_exists(".eslintrc.json")
		or file_exists(".eslintrc.yml")
		or file_exists(".eslintrc.yaml")
end

-- Modify linting callback to use default ESLint config if no config file exists
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.svelte", "*.vue" },
	callback = function()
		local eslint_cmd = "eslint_d"
		if not eslint_config_exists() then
			local default_config_path = vim.fn.expand("~/.config/default_eslintrc.json")
			eslint_cmd = string.format("eslint_d --config %s", default_config_path)
		end

		lint.linters.eslint_d.cmd = eslint_cmd
		lint.try_lint()
	end,
})

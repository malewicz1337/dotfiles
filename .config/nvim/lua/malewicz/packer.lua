vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	})
	-- use({
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- })
	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup()
	-- 		vim.cmd("colorscheme catppuccin")
	-- 	end,
	-- })

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("nvim-lua/plenary.nvim")
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	use({ "christoomey/vim-tmux-navigator" })

	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	})

	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use("mfussenegger/nvim-lint")

	use("github/copilot.vim")

	use("windwp/nvim-ts-autotag")

	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"linux-cultist/venv-selector.nvim",
		branch = "regexp",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "mfussenegger/nvim-dap" },
			{ "mfussenegger/nvim-dap-python", opt = true },
			{
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
				requires = { "nvim-lua/plenary.nvim" },
			},
		},
		config = function()
			local venv_selector = require("venv-selector")
			venv_selector.setup()
		end,
	})
	use("prisma/vim-prisma")
end)

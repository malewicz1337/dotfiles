return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status")

			lualine.setup({
				options = {
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
						},
						-- { "fileformat" },
						-- { "filetype" },
					},
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				timeout = 1800,
				top_down = false,
				stages = "fade",
				max_width = 30,
				fps = 360,

				-- Options: "default", "minimal", "simple", "compact"
				render = "minimal",
			})

			vim.notify = notify
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
					opts = { conceal = true },
				},
				messages = {
					view = "notify",
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
				},
				views = {
					cmdline_popup = {
						position = {
							row = "98%",
							col = "50%",
						},
						size = {
							width = "30%",
							height = "auto",
						},
						border = {
							style = "none", -- "none", "single", "double", "rounded", "solid", "shadow"
							padding = { 0, 0 }, -- {vertical, horizontal}
						},
					},
				},
			})
		end,
	},
}

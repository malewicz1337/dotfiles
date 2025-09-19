return {
	{
		"rainbowhxch/accelerated-jk.nvim",
		mode = "time_driven",
		enable_deceleration = true,
		acceleration_motions = {},
		acceleration_limit = 150,
		acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
		deceleration_table = { { 200, 3 }, { 300, 7 }, { 450, 11 }, { 600, 15 }, { 750, 21 }, { 900, 9999 } },
		config = function()
			vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gj)")
			vim.keymap.set("n", "l", "<Plug>(accelerated_jk_gk)")
		end,
	},
}

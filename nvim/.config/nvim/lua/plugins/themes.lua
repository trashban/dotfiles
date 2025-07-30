return {
	{
		"ramojus/mellifluous.nvim",
		config = function()
			require("mellifluous").setup({ colorset = "mountain" })
			vim.cmd("colorscheme mellifluous")
		end,
	},
}

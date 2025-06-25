return {
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- config = function()
		-- 	require("catppuccin").setup({
		-- 		flavour = "mocha", -- latte, frappe, macchiato, mocha
		-- 		transparent_background = false, -- disables setting the background color.
		-- 		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		-- 	})
		-- 	vim.cmd([[colorscheme catppuccin-mocha]])
		-- end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
}

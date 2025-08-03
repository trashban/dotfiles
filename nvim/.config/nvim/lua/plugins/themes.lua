return {
	{
		"EdenEast/nightfox.nvim",
		--config = function()
		--	vim.cmd("colorscheme carbonfox")
		--end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		--config = function()
		--    vim.g.moonflyNormalFloat = true
		--    vim.o.winborder = "single"
		--    vim.cmd [[colorscheme moonfly]]
		--end
	},
	{
		"hachy/eva01.vim",
		lazy = false,
		priority = 1000,
		--config = function()
		--    vim.cmd.colorscheme "eva01"
		--end
	},
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		--config = function()
		--    vim.cmd([[colorscheme modus]])
		--end
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		--config = function()
		--	require("cyberdream").setup({
		--		borderless_pickers = true,
		--		italic_comments = true,
		--		hide_fillchars = true,
		--		cache = true,
		--		colors = {
		--			bg = "#000000",
		--			magenta = "#5a4fcf",
		--			fg = "#eeeeee",
		--		},
		--	})
		--	vim.cmd([[colorscheme cyberdream]])
		--end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "night",
				-- disable italic for functions
				styles = {
					functions = {},
				},
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					colors.bg = "#000000"
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}

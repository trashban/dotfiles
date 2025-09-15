vim.pack.add({"https://github.com/folke/tokyonight.nvim"})

require("tokyonight").setup({
	style = "night",
	-- disable italic for functions
	-- styles = {
	-- 	functions = {},
	-- },
	on_colors = function(colors)
		colors.bg = "#000000"
	end,
})


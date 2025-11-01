vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/catppuccin/nvim"
})

require("tokyonight").setup({
	style = "night",
    transparent = true,
	-- disable italic for functions
	-- styles = {
	-- 	functions = {},
	-- },
    --
	on_colors = function(colors)
		colors.bg = "#000000"
	end,
})

-- require("catppuccin").setup({
--     flavour = "mocha",
--     color_overrides = {
--         all = {
--             base = "#000000",
--         },
--     }
-- })

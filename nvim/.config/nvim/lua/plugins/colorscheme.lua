-- i hoard quite a bit of colorschemes, so completly ignore this if you wish
vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/catppuccin/nvim",
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/rose-pine/neovim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/webhooked/kanso.nvim"
})

-- require('kanagawa').setup({
--     undercurl = true,
--     transparent = false,
--     theme = "wave",
-- })

require('kanso').setup({
    bold = true,
    italics = true,
    theme = "zen",
    transparent = true,
    terminalColors = true,
})

-- require("tokyonight").setup({
-- 	style = "night",
--     transparent = true,
-- 	-- disable italic for functions
-- 	-- styles = {
-- 	-- 	functions = {},
-- 	-- },
--     --
-- 	on_colors = function(colors)
-- 		colors.bg = "#000000"
-- 	end,
-- })

-- require("catppuccin").setup({
--     flavour = "mocha",
--     color_overrides = {
--         all = {
--             base = "#000000",
--         },
--     }
-- })

-- require("rose-pine").setup({
--     styles = {
--         bold = true,
--         italic = true,
--         transparency = true,
--     },
--
-- })

-- gruvbox configuration
-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_foreground = 'mix'
-- vim.g.gruvbox_material_enable_italic = true
-- vim.g.gruvbox_material_transparent_background = false

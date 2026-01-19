-- i hoard quite a bit of colorschemes, so completly ignore this if you wish
vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/catppuccin/nvim",
    "https://github.com/rose-pine/neovim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/bluz71/vim-moonfly-colors"
})

vim.g.moonflyTransparent = true

-- require('kanagawa').setup({
--     undercurl = true,
--     commentStyle = { italic = true },
--     transparent = false,
--     terminalColors = true, -- define vim.g.terminal_color_{0,17}
--     theme = "wave",
--     colors = {
--         theme = {
--             all = {
--                 ui = {
--                     -- bg = "#121416",
--                     bg_gutter = "none"
--                 }
--             }
--         }
--     }
-- })


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
--
require("catppuccin").setup({
    flavour = "mocha",
    color_overrides = {
        all = {
            base = "#0A0E14",
        },
    },
    transparent_background = true
})

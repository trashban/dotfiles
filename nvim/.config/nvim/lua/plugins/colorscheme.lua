-- i hoard quite a bit of colorschemes, so completly ignore this if you wish
vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/catppuccin/nvim",
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/rose-pine/neovim",
    "https://github.com/webhooked/kanso.nvim",
    "https://github.com/rebelot/kanagawa.nvim"
})

require('kanagawa').setup({
    undercurl = true,
    commentStyle = { italic = true },
    transparent = false,
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    theme = "wave",
    colors = {
        theme = {
            all = {
                ui = {
                    bg = "#181820",
                    bg_gutter = "none"
                }
            }
        }
    }
})

-- require('kanso').setup({
--     bold = true,
--     italics = true,
--     theme = "zen",
--     transparent = true,
--     terminalColors = true,
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
-- require("catppuccin").setup({
--     flavour = "mocha",
--     color_overrides = {
--         all = {
--             base = "#000000",
--         },
--     },
--     transparent_background = true
-- })

-- require("rose-pine").setup({
--     styles = {
--         bold = true,
--         italic = false,
--         transparency = true,
--     },
--
-- })

-- gruvbox configuration
-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_foreground = 'mix'
-- vim.g.gruvbox_material_enable_italic = true
-- vim.g.gruvbox_material_transparent_background = true

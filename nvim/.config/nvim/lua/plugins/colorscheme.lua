vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/metalelf0/black-metal-theme-neovim",
    { src = "https://github.com/bluz71/vim-moonfly-colors", name = "moonfly" },
    "https://github.com/vossenwout/guts.nvim",
    "https://github.com/folke/tokyonight.nvim"
})

require("tokyonight").setup({
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
    dim_inactive = false,
    on_colors = function(colors)
        colors.bg = "#000000"       -- Normal background
        colors.bg_dark = "#000000"  -- Darker panels (e.g., NvimTree, Telescope)
        colors.bg_float = "#000000" -- Floating windows
        colors.bg_statusline = "#000000" -- Statusline background
    end
})

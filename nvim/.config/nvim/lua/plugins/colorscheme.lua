vim.pack.add({
    "https://github.com/folke/tokyonight.nvim"
})

require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
})

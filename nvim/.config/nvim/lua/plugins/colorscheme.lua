vim.pack.add({
    "https://github.com/catppuccin/nvim",
})

require("catppuccin").setup({
    flavour = "mocha",
    color_overrides = {
        all = {
            base = "#0A0E14",
        },
    },
    transparent_background = true
})

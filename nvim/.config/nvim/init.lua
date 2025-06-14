-- call nvim settings
require("config.settings")

-- call lazy (plugin manager)
require("config.lazy")

-- call custom keybinds for plugins
require("config.keybinds")

-- call lsp and related settings
require("config.lsp")

require("config.statusline")

-- call colourscheme
require("catppuccin").setup({
    flavour = "latte", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
})
vim.cmd [[colorscheme catppuccin-mocha]]

require("notify").setup({
  background_colour = "#000000",
})

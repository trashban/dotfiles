-- call nvim settings
require("config.settings")

-- call lazy (plugin manager)
require("config.lazy")

-- call custom keybinds for plugins
require("config.keybinds")

-- call lsp and related settings
require("config.lsp")

-- call statusbar config
-- require("config.line")

require("notify").setup({
	background_colour = "#000000",
})

vim.wo.fillchars = "eob: "
vim.g.moonflyWinSeparator = 2

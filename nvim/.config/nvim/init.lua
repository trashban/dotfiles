-- call nvim settings
require("config.settings")

-- call lazy (plugin manager)
require("config.lazy")

-- call custom keybinds for plugins
require("config.keybinds")

-- call lsp and related settings
require("config.lsp")

-- call statusbar config
-- require("config.statusbar")

-- call colourschemehe
-- vim.cmd([[colorscheme rose-pine]])

require("notify").setup({
	background_colour = "#000000",
})

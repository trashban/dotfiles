-- call lazy (plugin manager)
require("config.lazy")

-- call personal-settings (located in lua/plugins/settings.lua)
require("config.settings")

-- select theme 
vim.cmd.colorscheme "everblush"

require('lualine').setup {
	    theme = 'iceberg_dark',
}

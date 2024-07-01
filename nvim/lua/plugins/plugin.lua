return {
	'MunifTanjim/nui.nvim',
	'nvim-tree/nvim-web-devicons',
	'nvim-neo-tree/neo-tree.nvim',
   	branch = 'v3.x',
    	dependencies = {
     		'nvim-lua/plenary.nvim',
      		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
    	},
	'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup{}
		end,
	'romgrk/barbar.nvim',
		dependencies = {'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons'},
		init = function() vim.g.barbar_auto_setup = false end,
	'nvim-telescope/telescope.nvim', tag = '0.1.x',
     		dependencies = { 'nvim-lua/plenary.nvim' },
}


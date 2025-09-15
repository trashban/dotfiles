vim.pack.add({"https://github.com/rachartier/tiny-inline-diagnostic.nvim"})

require("tiny-inline-diagnostic").setup({
	-- Available options: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
	preset = "modern",
	transparent_bg = false,
	transparent_cursorline = true,
})

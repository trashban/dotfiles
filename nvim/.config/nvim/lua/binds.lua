-- essential
vim.keymap.set("n", "<leader>u", ":so<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>w", ":w<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>q", ":q!<CR>")

-- mini
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>o", ":Pick oldfiles<CR>")
vim.keymap.set("n", "<leader>s", ':Pick lsp scope="document_symbol"<CR>')
vim.keymap.set("n", "<leader>S", ':Pick lsp scope="workspace_symbol"<CR>')
vim.keymap.set("n", "<leader>D", ":Pick diagnostic<CR>")
vim.keymap.set("n", "<leader>r", ":lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")

-- formatter (conform)
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
vim.keymap.set("n", "grq", ":Format<CR>")

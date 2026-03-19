vim.lsp.enable({
    "clangd",
    "rust_analyzer",
    "ols",
    "zls",
    "gopls",
    "lua_ls",
    "ts_ls",
    "jdtls",
    "basedpyright"
})
vim.cmd("set completeopt+=noselect")

-- lsp specific keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
		end

		map({ "n", "v" }, "ga", vim.lsp.buf.code_action, "Code Action")
		map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
		map("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
		map("n", "grr", vim.lsp.buf.references, "Goto References")
		map("n", "grn", vim.lsp.buf.rename, "Rename symbol")
	end,
})

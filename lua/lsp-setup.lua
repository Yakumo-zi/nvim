local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"ts_ls",
	"clangd",
	"gopls",
	"jsonls",
	"html",
	"cssls",
	"eslint",
})

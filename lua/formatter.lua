require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		jsonc = { "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofumpt" },
	},
	formatters = {
		goimports = {
			command = vim.fn.exepath("goimports") ~= "" and vim.fn.exepath("goimports") or "goimports",
		},
		gofumpt = {
			command = vim.fn.exepath("gofumpt") ~= "" and vim.fn.exepath("gofumpt") or "gofumpt",
			-- 需要更严格风格时改为 { "-extra" }
			args = {},
		},
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

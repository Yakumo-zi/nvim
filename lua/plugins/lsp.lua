return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				clangd = {},
				gopls = {},
				pyright = {},
			},
		},
		config = function(_, opts)
			vim.diagnostic.config({
				update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
			vim.cmd([[
              autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
            ]])
			local lspconfig = require("lspconfig")
			local cfg = require("configs.lsp")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				config.on_attach = cfg.on_attach
				lspconfig[server].setup(config)
			end
		end,
	},
}

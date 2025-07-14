return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		event = "LspAttach",
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" } },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true, window = { border = "rounded" } },
				menu = {
					border = "rounded",
					auto_show = true,
				},
			},
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
			cmdline = {
				completion = { ghost_text = { enabled = true }, menu = { auto_show = true } },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

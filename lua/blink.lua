local cmp = require("blink.cmp")
cmp.setup({
	keymap = {
		preset = "super-tab",
		-- Accept the selected completion item with Enter
		["<CR>"] = { "accept", "fallback" },
		-- Stop snippet session on Esc, then fall through to default hide/exit behavior
		["<Esc>"] = {
			function()
				if vim.snippet.active() then
					vim.snippet.stop()
				end
			end,
			"hide",
			"fallback",
		},
	},
	completion = { documentation = { auto_show = true } },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = { implementation = "rust" },
})

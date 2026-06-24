local cmp = require("blink.cmp")
cmp.setup({
	keymap = { preset = "default" },
	completion = { documentation = { auto_show = true } },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = { implementation = "rust" },
})

vim.pack.add({ "https://github.com/nvim-mini/mini.pairs" })
vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" })
vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
vim.pack.add({ "https://github.com/romgrk/barbar.nvim" })
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
})
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
})

require("mini.pairs").setup()
require("mini.statusline").setup()

require("yazi").setup({
	open_for_directories = false,
	keymaps = {
		show_help = "<f1>",
	},
})

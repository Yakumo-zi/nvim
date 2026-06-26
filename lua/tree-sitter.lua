require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"lua",
	"vim",
	"vimdoc",
	"markdown",
	"python",
	"go",
	"rust",
	"javascript",
	"typescript",
	"svelte",
	"css",
	"html",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"vim",
		"vimdoc",
		"markdown",
		"python",
		"go",
		"rust",
		"javascript",
		"typescript",
		"svelte",
		"css",
		"html",
	},
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

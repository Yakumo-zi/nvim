return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
			},
			{
				"<leader>fw",
				function()
					require("fzf-lua").live_grep()
				end,
			},
			{
				"<leader>fc",
				function()
					require("fzf-lua").grep_cword()
				end,
			},
			{
				"gr",
				function()
					require("fzf-lua").lsp_references()
				end,
			},
			{
				"gi",
				function()
					require("fzf-lua").lsp_implementations()
				end,
			},
			{
				"gd",
				function()
					require("fzf-lua").lsp_definitions()
				end,
			},
			{
				"gD",
				function()
					require("fzf-lua").lsp_declarations()
				end,
			},
		},
		opts = {
			fzf_colors = {
				bg = -1,
				gutter = -1,
			},
		},
	},
}

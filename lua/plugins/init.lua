return {
	{ lazy = true, "nvim-lua/plenary.nvim" },

	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ "echasnovski/mini.statusline", opts = {} },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
		flavour = "latte",
	} },

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = {
      update_focused_file={
        enable=true
      }
    },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

	-- we use blink plugin only when in insert mode
	-- so lets lazyload it at InsertEnter event
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",

			-- snippets engine
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			-- autopairs , autocompletes ()[] etc
			{ "windwp/nvim-autopairs", opts = {} },
		},
		-- made opts a function cuz cmp config calls cmp module
		-- and we lazyloaded cmp so we dont want that file to be read on startup!
		opts = function()
			return require("plugins.configs.blink")
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall" },
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = require("plugins.configs.conform"),
	},

	{
		"nvimdev/indentmini.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-- files finder etc
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = require("plugins.configs.telescope"),
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
		end,
	},

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		config = function(_, opts)
			require("plugins.configs.go").setup(opts)
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	event = "LspAttach",
	opts = {
    backend = "delta",

  },
}

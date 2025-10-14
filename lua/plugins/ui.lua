return {
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "echasnovski/mini.statusline", opts = {} },
  { "lewis6991/gitsigns.nvim", opts = {} },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte",
    },
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  {
    "nvimdev/indentmini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "rrethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 350,
        filetypes_denylist = {
          "aerial",
          "neo-tree",
        },
        modes_denylist = { "v", "V" },
        under_cursor = false,
      })
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = function() require("plugins.configs.aerial") end,
    config = function(_, opts)
      require("aerial").setup(opts)
      vim.keymap.set(
        "n",
        "<space>so",
        "<cmd>AerialToggle<cr>",
        { silent = true }
      )
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      require("notify").setup({
        fps = 60,
      })
      vim.notify = require("notify")
    end,
  },
}

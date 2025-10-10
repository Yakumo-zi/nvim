return {
  { lazy = true, "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {
      update_focused_file = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },
  {
    "stevearc/conform.nvim",
    opts = require("plugins.configs.conform"),
  },
  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require("plugins.configs.telescope"),
  },
}

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
    config = function()
      local opts = require("plugins.configs.treesitter")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() require("plugins.configs.textobjects") end,
  },

  {
    "stevearc/conform.nvim",
    opts = require("plugins.configs.conform"),
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({
        -- 预设配置：'default', 'max-perf', 'fzf-native', 'telescope', 'skim'
        -- 'telescope' 预设会让窗口布局看起来像 telescope
        winopts = {
          preview = {
            default = "bat", -- 使用 bat 预览，如果没有会自动回退到 cat/head
            layout = "flex", -- 自动适应窗口大小
          },
        },
        -- 关键：针对 LSP 的配置
        lsp = {
          code_actions = {
            previewer = "codeaction_native",
            preview_pager = "delta -n --color-only --hunk-header-style='omit' --file-style='omit'",
          },
        },
      })
    end,
    -- 常用快捷键映射
    keys = {
      { "<leader>pf", "<cmd>FzfLua files<cr>", desc = "Find Files" },
      { "<leader>ps", "<cmd>FzfLua live_grep<cr>", desc = "Grep Project" },
      { "<leader>pb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
      { "<leader>ph", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
      -- 替代 LSP 功能
      { "Gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Go to Definition" },
      { "Gr", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
      {
        "<leader>ca",
        "<cmd>FzfLua lsp_code_actions<cr>",
        desc = "Code Actions",
      },
    },
  },
}

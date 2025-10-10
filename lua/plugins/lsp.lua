return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {
            "rust_analyzer",
          },
        },
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    dependencies = "neovim/nvim-lspconfig",
    ft = "lua",
    opts = true,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = function() require("plugins.configs.fidget") end,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    opts = {
      text_format = function(symbol)
        local res = {}
        if symbol.references then
          local usage = symbol.references == 1 and "reference" or "references"
          table.insert(
            res,
            { ("󰌹  %s %s"):format(symbol.references, usage), "LspCodeLens" }
          )
        end
        return res
      end,
    },
  },
}

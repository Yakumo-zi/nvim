return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "folke/lazydev.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Note: blink.cmp provides capabilities for LSP to enable autocompletion support
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        "clangd",
        "lua_ls",
      }

      mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = false,
        handlers = {
          function(server_name)
            local opts = {
              capabilities = capabilities,
            }

            -- Attempt to load server-specific configuration from lua/lsp/<server_name>.lua
            local require_ok, settings = pcall(require, "lsp." .. server_name)
            if require_ok then
              opts = vim.tbl_deep_extend("force", settings, opts)
            end

            lspconfig[server_name].setup(opts)
          end,
        },
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = function() return require("plugins.configs.fidget") end,
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
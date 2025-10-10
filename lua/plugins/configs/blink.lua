return {
  snippets = { preset = "luasnip" },
  cmdline = { enabled = true },
  appearance = { nerd_font_variant = "mono" },
  fuzzy = { implementation = "prefer_rust" },
  sources = { default = { "lsp", "snippets", "buffer", "path" } },

  keymap = {
    preset = "default",
    ["<CR>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f"] = { "scroll_documentation_down", "fallback" },
  },
  completion = {
    ghost_text = { enabled = true },
    list = {
      selection = {
        preselect = false,
      },
    },
    menu = {
      border = "rounded",
      draw = {},
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
      },
    },
  },
  signature = {
    enabled = true,
    window = { border = "rounded" },
  },
}

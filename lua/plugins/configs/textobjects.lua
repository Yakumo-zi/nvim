local is_ok, configs = pcall(require, "nvim-treesitter.configs")
if not is_ok then return end

configs.setup({
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["as"] = {
          query = "@local.scope",
          query_group = "locals",
          desc = "Select language scope",
        },
        ["id"]="@conditional.inner",
        ["ad"]="@conditional.outer"
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      include_surrounding_whitespace = true,
    },
  },
})

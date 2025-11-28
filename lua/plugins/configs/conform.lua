return {
  formatters_by_ft = {
    ["lua"] = { "stylua" },
    ["cpp"] = { "clang-format" },
    ["c"] = { "clang-format" },
    ["go"] = { "goimports", "gofmt" },
    ["rust"] = { "rustfmt" },
    ["javascript"] = { "prettier" },
    ["javascriptreact"] = { "prettier" },
    ["typescript"] = { "prettier" },
    ["python"] = { "ruff" },
    ["json"]={"prettier"}
  },
}

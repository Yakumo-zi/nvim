-- Use LspAttach autocommand to only map the following keys
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set(
      "n",
      "<space>wl",
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      opts
    )
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set(
      "n",
      "K",
      function() vim.lsp.buf.hover({ border = "rounded" }) end,
      opts
    )
  end,
})

-- 1. 缩短悬停触发时间
vim.o.updatetime = 300

-- 自动切换根目录 (Auto-Root)
-- 逻辑：当打开文件时，向上寻找 .git 或 go.mod，如果找到就切换过去
local root_names = {
  ".git",
  "go.mod",
  "Makefile",
  "package.json",
  ".luarc.json",
  "CMakeLists.txt",
}

-- 缓存以避免重复查找
local root_cache = {}

local set_root = function()
  -- 获取当前文件路径
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then return end
  path = vim.fs.dirname(path)

  -- 尝试从缓存获取
  local root = root_cache[path]
  if root == nil then
    -- 使用 Neovim 内置的 fs.find 向上查找
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file then
      root = vim.fs.dirname(root_file)
      root_cache[path] = root
    end
  end

  if root and root ~= vim.fn.getcwd() then
    vim.cmd.cd(root)
    vim.notify("Root changed to " .. root)
  end
end

vim.api.nvim_create_autocmd("BufEnter", { callback = set_root })

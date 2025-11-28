local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferPrevious <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>fm", function() require("conform").format() end)

-- change window
map({ "n", "t" }, "<c-h>", "<cmd> wincmd h<CR>")
map({ "n", "t" }, "<c-j>", "<cmd> wincmd j<CR>")
map({ "n", "t" }, "<c-k>", "<cmd> wincmd k<CR>")
map({ "n", "t" }, "<c-l>", "<cmd> wincmd l<CR>")

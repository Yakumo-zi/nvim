local terminal = require("terminal")
local buffer = require("buffer")

vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>buffers<cr>:buffer ")
vim.keymap.set("n", "<leader>so", "<cmd>source<cr>")
vim.keymap.set("n", "<leader>Q", "<cmd>wq<cr>")
vim.keymap.set("n", "<leader>q", function()
	buffer.smart_delete(false)
end)
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-H>", "<C-w>H")
vim.keymap.set("n", "<A-J>", "<C-w>J")
vim.keymap.set("n", "<A-K>", "<C-w>K")
vim.keymap.set("n", "<A-L>", "<C-w>L")

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float({
		scope = "line",
		border = "rounded",
		source = "if_many",
	})
end, { desc = "Line diagnostic" })

vim.keymap.set("n", "[b", "<cmd>BufferPrevious<cr>")
vim.keymap.set("n", "]b", "<cmd>BufferNext<cr>")

vim.keymap.set("n", "<leader>gw", function()
	local word = vim.fn.expand("<cword>")
	vim.cmd("silent grep! -w -- " .. vim.fn.shellescape(word) .. " .")
	vim.cmd("copen")
end, { desc = "Grep word under cursor" })

vim.keymap.set("n", "<leader>t", terminal.toggle)
vim.keymap.set({ "n", "t" }, "<C-->", "<cmd>vertical resize -5<cr>")
vim.keymap.set({ "n", "t" }, "<C-=>", "<cmd>vertical resize +5<cr>")
vim.keymap.set({ "n", "t" }, "<A-->", "<cmd>resize -5<cr>")
vim.keymap.set({ "n", "t" }, "<A-=>", "<cmd>resize +5<cr>")

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "<A-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<A-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<A-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<A-l>", "<Right>", { noremap = true })

vim.keymap.set("i", "<A-b>", "<C-Left>", { noremap = true, desc = "Word backward" })
vim.keymap.set("i", "<A-f>", "<C-Right>", { noremap = true, desc = "Word forward" })
vim.keymap.set("i", "<A-a>", "<Home>", { noremap = true, desc = "Line start" })
vim.keymap.set("i", "<A-e>", "<End>", { noremap = true, desc = "Line end" })

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<CR>", {
	desc = "Open yazi at current file",
})

vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<CR>", {
	desc = "Open yazi in cwd",
})

vim.keymap.set("n", "<leader>e", "<cmd>Yazi toggle<CR>", {
	desc = "Resume yazi",
})

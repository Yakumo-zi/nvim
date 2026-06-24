local M = {
	term_buf = nil,
	term_win = nil,
}

M.toggle = function()
	if M.term_win and vim.api.nvim_win_is_valid(M.term_win) then
		vim.api.nvim_win_hide(M.term_win)
		return
	end

	vim.cmd("botright 15split")
	M.term_win = vim.api.nvim_get_current_win()

	if M.term_buf and vim.api.nvim_buf_is_valid(M.term_buf) then
		vim.api.nvim_win_set_buf(M.term_win, M.term_buf)
	else
		vim.cmd("terminal")
		M.term_buf = vim.api.nvim_get_current_buf()
	end

	vim.cmd("startinsert")
end

M.exec = function(shell_cmd)
	vim.cmd("botright split | terminal " .. shell_cmd)
end

return M

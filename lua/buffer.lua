local Buffer = {}

function Buffer.visible_in_other_window(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local current_win = vim.api.nvim_get_current_win()

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if win ~= current_win and vim.api.nvim_win_get_buf(win) == bufnr then
			return true
		end
	end

	return false
end

function Buffer.get_fallback(current)
	current = current or vim.api.nvim_get_current_buf()

	-- 优先使用 alternate buffer，也就是 Ctrl-^ 那个 buffer
	local alt = vim.fn.bufnr("#")
	if alt > 0 and alt ~= current and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
		return alt
	end

	-- 否则找任意一个 listed buffer
	for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		if info.bufnr ~= current then
			return info.bufnr
		end
	end

	return nil
end

function Buffer.smart_delete(force)
	local current = vim.api.nvim_get_current_buf()
	local visible_elsewhere = Buffer.visible_in_other_window(current)
	local fallback = Buffer.get_fallback(current)

	-- 当前 window 先切到别的 buffer
	if fallback then
		vim.api.nvim_win_set_buf(0, fallback)
	else
		vim.cmd("enew")
	end

	-- 如果当前 buffer 还在其他 window 显示，就不要删除它
	if visible_elsewhere then
		return
	end

	local ok, err = pcall(function()
		vim.cmd((force and "bdelete! " or "bdelete ") .. current)
	end)

	if not ok then
		vim.notify(err, vim.log.levels.WARN)
	end
end

return Buffer

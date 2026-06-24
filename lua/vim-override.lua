vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.notify = function(msg, level, opts)
	level = level or vim.log.levels.INFO
	opts = opts or {}

	local lines = vim.split(tostring(msg), "\n")
	local width = 0

	for _, line in ipairs(lines) do
		width = math.max(width, vim.fn.strdisplaywidth(line))
	end

	width = math.min(math.max(width + 4, 20), math.floor(vim.o.columns * 0.5))

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local win = vim.api.nvim_open_win(buf, false, {
		relative = "editor",
		width = width,
		height = #lines,
		row = 1,
		col = vim.o.columns - width - 2,
		style = "minimal",
		border = "rounded",
	})

	local timeout = opts.timeout or 2500

	vim.defer_fn(function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
		if vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end, timeout)
end

vim.diagnostic.config({
	update_in_insert = false,

	virtual_text = false,
	-- 关闭整行 diagnostic 展示，避免占屏幕
	virtual_lines = false,

	-- 只给 error / warning 显示左侧标记
	signs = {
		severity = { min = vim.diagnostic.severity.WARN },
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},

	-- underline 只标错误，不要所有 warning/hint 都画线
	underline = false,

	-- 浮窗里再看完整信息
	float = {
		border = "rounded",
		source = "if_many",
	},

	-- 严重问题排前面
	severity_sort = true,
})

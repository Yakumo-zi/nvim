local M = {}

M.executable = function(cmd)
	return vim.fn.executable(cmd) == 1
end

M.notify = function(msg, level)
	vim.notify(msg, level or vim.log.levels.INFO)
end

M.execute_cmd = function(cmd, callback)
	local obj = vim.system(cmd, { text = true }):wait()
	callback(obj)
end

M.execute_cmd_async = function(cmd, on_exit)
	vim.system(cmd, { text = true }, on_exit)
end

return M

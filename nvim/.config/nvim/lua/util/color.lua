local M = {}
local path = vim.fn.stdpath("data") .. "/last_colorscheme.txt"

function M.get_saved()
	local f = io.open(path, "r")
	if not f then
		return "everforest"
	end -- Default fallback
	local color = f:read("*all"):gsub("%s+", "")
	f:close()
	return color
end

function M.save(name)
	local f = io.open(path, "w")
	if f then
		f:write(name)
		f:close()
	end
end

return M

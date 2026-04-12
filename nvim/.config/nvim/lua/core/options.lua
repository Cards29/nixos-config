vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.updatetime = 50
opt.fcs = "eob: "

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.undofile = true
opt.conceallevel = 0
opt.showtabline = 0
opt.statusline = "%f %r %m%="
opt.winborder = "rounded"
opt.laststatus = 3

-- Fix for vim-tmux-navigator / netrw <C-l> conflict
vim.g.tmux_navigator_disable_netrw_workaround = 1

local group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	group = group,
	callback = function()
		vim.api.nvim_set_hl(0, "YankHighlight", {
			bg = "#9a5a3a",
			fg = "#d8d8e6",
		})
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlight",
			timeout = 200,
		})
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
	callback = function()
		local directory = vim.fn.expand("%:p:h")
		if not directory:match("^%w+:") and vim.fn.isdirectory(directory) == 0 then
			vim.fn.mkdir(directory, "p")
		end
	end,
})

-- Restore cursor to last known position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(event)
		local buf = event.buf
		if vim.tbl_contains({ "gitcommit" }, vim.bo[buf].filetype) or vim.b[buf].last_loc then
			return
		end
		vim.b[buf].last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Equalize splits when the terminal window is resized
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Color for git blame message
-- Helper to lighten a hex color
local function lighten_color(hex, percentage)
	local r = tonumber(hex:sub(2, 3), 16)
	local g = tonumber(hex:sub(4, 5), 16)
	local b = tonumber(hex:sub(6, 7), 16)

	r = math.min(255, math.floor(r + (255 - r) * percentage))
	g = math.min(255, math.floor(g + (255 - g) * percentage))
	b = math.min(255, math.floor(b + (255 - b) * percentage))

	return string.format("#%02x%02x%02x", r, g, b)
end

local function sync_git_blame_hl()
	-- 1. Grab current theme colors
	local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
	local comment = vim.api.nvim_get_hl(0, { name = "Comment" })

	-- 2. Convert Decimal colors to Hex
	local bg_hex = string.format("#%06x", normal.bg or 0x1f1f28)
	local fg_hex = string.format("#%06x", comment.fg or 0x727169)

	-- 3. Create a background that is 10% brighter than the theme background
	local dynamic_bg = lighten_color(bg_hex, 0.15)
	local dynamic_fg = lighten_color(fg_hex, 0.35)

	-- 4. Apply the new highlight
	vim.api.nvim_set_hl(0, "GitBlameMsg", {
		fg = dynamic_fg,
		bg = dynamic_bg,
		italic = true,
	})
end

-- Run on startup and whenever you switch themes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = sync_git_blame_hl,
})

-- Initial run
sync_git_blame_hl()

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })

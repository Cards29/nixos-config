vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "j", "gj", { desc = "Visual down" })
keymap.set("n", "k", "gk", { desc = "Visual up" })

keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Go to first non-blank character" })
keymap.set({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" })

keymap.set("n", "<leader>w", "<cmd>wa<CR>", { desc = "Write all" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Write & quit" })
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sm", function()
	local current_win = vim.api.nvim_get_current_win()
	local is_max_h = vim.api.nvim_win_get_height(current_win) >= (vim.o.lines - 3)
	local is_max_w = vim.api.nvim_win_get_width(current_win) >= (vim.o.columns - 2)

	if is_max_h and is_max_w then
		vim.cmd("wincmd =")
	else
		vim.cmd("wincmd |")
		vim.cmd("wincmd _")
	end
end, { desc = "Toggle maximize current split" })

-- <leader>se is now free!
-- You can now safely use it for Scissors or any other mapping.

keymap.set("n", "<leader>=", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })
keymap.set("n", "<leader>-", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
keymap.set("n", "<leader>+", "<cmd>horizontal resize +2<CR>", { desc = "Increase height" })
keymap.set("n", "<leader>_", "<cmd>horizontal resize -2<CR>", { desc = "Decrease height" })

keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Move half page down" })
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Move half page up" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

keymap.set("v", "<", "<gv", { desc = "Indent left & reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right & reselect" })

keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })
keymap.set({ "n", "v" }, "X", '"_dd<Esc>', { desc = "Delete without yanking" })

keymap.set("n", "dd", function()
	local line_content = vim.api.nvim_get_current_line()
	if line_content:match("^%s*$") then
		vim.api.nvim_feedkeys('"_dd', "n", false)
	else
		vim.api.nvim_feedkeys("dd", "n", false)
	end
end, { desc = "Delete line" })

keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

keymap.set("n", "<Esc>", "<Esc>:nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open lazy.nvim" })

-- add here

keymap.set("n", "<leader>cc", function()
	local color = vim.g.colors_name
	if color then
		require("util.color").save(color)
		Snacks.notify("Colorscheme saved: " .. color)
	else
		Snacks.notify("No colorscheme set", { level = "warn" })
	end
end, { desc = "Save Current Colorscheme" })

-- keymap.set("n", "<leader>mp", function()
-- 	local scene_name = vim.fn.expand("<cword>")
-- 	local file_name = vim.fn.expand("%")
--
-- 	vim.cmd(string.format("split | term manim -pqh %s %s", file_name, scene_name))
-- end, { desc = "Run Manim on class under cursor" })

keymap.set("n", "<leader>uh", function()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

keymap.set("n", "<leader>uw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle Wrap" })

keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable Up arrow" })
keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable Down arrow" })
keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable Left arrow" })
keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable Right arrow" })

keymap.set({ "n", "v", "i" }, "<C-Up>", "<Nop>", { desc = "Disable Ctrl + Up arrow" })
keymap.set({ "n", "v", "i" }, "<C-Down>", "<Nop>", { desc = "Disable Ctrl + Down arrow" })
keymap.set({ "n", "v", "i" }, "<C-Left>", "<Nop>", { desc = "Disable Ctrl + Left arrow" })
keymap.set({ "n", "v", "i" }, "<C-Right>", "<Nop>", { desc = "Disable Ctrl + Right arrow" })

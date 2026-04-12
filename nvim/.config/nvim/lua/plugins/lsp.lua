return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			-- 1. Setup Mason
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- 2. Setup Mason LSP Config
			local servers = {
				-- Web/JS/TS
				ts_ls = {},
				html = {},
				cssls = {},
				tailwindcss = {},
				svelte = {},
				graphql = {},
				emmet_ls = {},
				prismals = {},

				-- Python
				pyright = {},

				-- C/C++
				clangd = {},

				-- Rust
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
							procMacro = {
								enable = true,
							},
						},
					},
				},
			}

			-- 5. Setup mason-lspconfig (only for installation)
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
			})

			-- 3. Setup Mason Tool Installer (Linters/Formatters)
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
				},
			})

			-- 4. Modern Neovim 0.11+ Server Setup with Blink
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for name, opts in pairs(servers) do
				vim.lsp.config(
					name,
					vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, opts)
				)

				vim.lsp.enable(name)
			end

			-- 5. Diagnostic Config
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					spacing = 2,
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			-- 6. LSP Attach Autocmd (Keymaps)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- enable inlay hints automatically
					vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, {
							buffer = ev.buf,
							silent = true,
							desc = desc,
						})
					end

					-- Navigation
					map("n", "gd", Snacks.picker.lsp_definitions, "Definitions")
					map("n", "gD", Snacks.picker.lsp_declarations, "Declarations")
					map("n", "gr", Snacks.picker.lsp_references, "References")
					map("n", "gi", Snacks.picker.lsp_implementations, "Implementations")
					map("n", "gt", Snacks.picker.lsp_type_definitions, "Type Definitions")

					-- Symbols
					map("n", "<leader>ss", Snacks.picker.lsp_symbols, "Document Symbols")
					map("n", "<leader>sS", Snacks.picker.lsp_workspace_symbols, "Workspace Symbols")

					-- Calls
					map("n", "<leader>ci", Snacks.picker.lsp_incoming_calls, "Incoming Calls")
					map("n", "<leader>co", Snacks.picker.lsp_outgoing_calls, "Outgoing Calls")

					-- Actions
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")

					-- Hover (with border)
					map("n", "K", function()
						vim.lsp.buf.hover({ border = "rounded" })
					end, "Hover Docs")

					-- Utils
					map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
					map("n", "<leader>sl", "<cmd>LspLog<CR>", "LSP Log")
				end,
			})
		end,
	},
}

return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = function()
			local utils = require("conform.util")
			return {
				notify_on_error = true,
				format_on_save = function(bufnr)
					-- Disable "format_on_save lsp_fallback" for languages that don't
					-- have a well standardized coding style. You can add additional
					-- languages here or re-enable it for the disabled ones.
					local disable_filetypes = { c = true, cpp = true }
					local lsp_format_opt
					if disable_filetypes[vim.bo[bufnr].filetype] then
						lsp_format_opt = "never"
					else
						lsp_format_opt = "fallback"
					end
					return {
						timeout_ms = 1000,
						lsp_format = lsp_format_opt,
					}
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform can also run multiple formatters sequentially
					-- python = { "isort", "black" },
					--
					-- You can use 'stop_after_first' to run the first available formatter from the list
					json = { "prettierd", "prettier", stop_after_first = true },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					astro = { "prettier" },
					css = { "prettierd", "prettier", stop_after_first = true },
					php = { "pint" },
				},
				format_after_save = { lsp_fallback = true },
				formatters = {
					prettier = {
						prepend_args = function()
							return {
								"--config-precedence",
								"prefer-file",
								"--with-node-modules",
							}
						end,
					},
					phpcbf = {
						command = "vendor/bin/phpcbf",
						args = { "--standard=PSR12", "$FILENAME" },
						cwd = utils.root_file({ ".editorconfig", "composer.json" }),
						stdin = false,
					},
					["php-cs-fixer"] = {
						command = "vendor/bin/php-cs-fixer",
						args = {
							"fix",
							-- "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
							"$FILENAME",
						},
						stdin = false,
					},
				},
			}
		end,
	},
}

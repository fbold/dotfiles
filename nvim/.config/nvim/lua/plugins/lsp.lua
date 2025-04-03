return {
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-u>"] = cmp.mapping.confirm({ select = true }),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "b0o/schemastore.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")),
			})
			require("lspconfig.ui.windows").default_options.border = "single"

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})

			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						-- on_attach = require("plugins.lsp.on_attach").on_attach,
						settings = require("plugins.lsp.servers")[server_name],
						filetypes = (require("plugins.lsp.servers")[server_name] or {}).filetypes,
					})
				end,
			})

			vim.diagnostic.config({
				title = false,
				underline = true,
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					source = "if_many",
					style = "minimal",
					border = "rounded",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}

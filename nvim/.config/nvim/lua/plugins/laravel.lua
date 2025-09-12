return {
	"adalessa/laravel.nvim",
	dependencies = {
		"tpope/vim-dotenv",
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"kevinhwang91/promise-async",
		"nvim-neotest/nvim-nio",
	},
	cmd = { "Laravel" },
	keys = {
		{ "<leader>la", ":Laravel artisan<cr>" },
		{ "<leader>lr", ":Laravel routes<cr>" },
		{ "<leader>lm", ":Laravel related<cr>" },
	},
	event = { "VeryLazy" },
	opts = {
		lsp_server = "phpactor",
		features = {
			route_info = {
				enable = false,
				view = "top",
			},
			model_info = {
				enable = false,
			},
			override = {
				enable = true,
			},
			pickers = {
				enable = true,
				provider = "telescope",
			},
		},
	},
	config = true,
}

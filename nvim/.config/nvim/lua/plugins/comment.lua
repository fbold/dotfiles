return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			-- add any options here
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		},
	},
}

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = function()
		local harpoon = require("harpoon")
	-- stylua: ignore
	local keys = {
		{"<leader>a", function() harpoon:list():add() end, desc = "[H]arpoon File" },
		{"<leader>aa", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "[h]arpoon Quick Menu"},
		{"<leader>y", function() harpoon:list():select(1) end, desc = "Harpoon to File 1", },
		{"<leader>u", function() harpoon:list():select(2) end, desc = "Harpoon to File 2", },
		{"<leader>i", function() harpoon:list():select(3) end, desc = "Harpoon to File 3", },
		{"<leader>o", function() harpoon:list():select(4) end, desc = "Harpoon to File 4", },
	}
		return keys
	end,
}

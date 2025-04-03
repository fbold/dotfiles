return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = function()
	local harpoon = require("harpoon")
	local keys = {
		{"<leader>a", function() harpoon:list():add() end, desc = "[H]arpoon File" },
		{"<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "[h]arpoon Quick Menu"},
		{"<leader>j", function() harpoon:list():select(1) end, desc = "Harpoon to File 1", },
	      	{"<leader>k", function() harpoon:list():select(2) end, desc = "Harpoon to File 2", },
	      	{"<leader>l", function() harpoon:list():select(3) end, desc = "Harpoon to File 3", },
	      	{"<leader>;", function() harpoon:list():select(4) end, desc = "Harpoon to File 4", },
	}
	return keys
    end,
}

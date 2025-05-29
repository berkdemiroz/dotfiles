return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	flavour = "mocha",
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}

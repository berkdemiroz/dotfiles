return {
	"gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.termguicolors = true
		require("nord").setup({})
		vim.cmd.colorscheme("nord")
	end,
}

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>sh", require("fzf-lua").helptags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", require("fzf-lua").keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", require("fzf-lua").files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", require("fzf-lua").builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", require("fzf-lua").grep_cword, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", function()
			require("fzf-lua").live_grep({ cwd = vim.fn.getcwd() })
		end, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", require("fzf-lua").diagnostics_workspace, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", require("fzf-lua").resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set(
			"n",
			"<leader>s.",
			require("fzf-lua").oldfiles,
			{ desc = '[S]earch Recent Files ("." for repeat)' }
		)
		vim.keymap.set("n", "<leader>gs", require("fzf-lua").git_status, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader><leader>", function()
			require("fzf-lua").buffers({ ignore_current_buffer = true, sort_mru = true, path_display = { "tail" } })
		end)
	end,
}

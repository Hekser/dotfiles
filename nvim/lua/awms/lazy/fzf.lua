return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({}) -- keep all defaults

			-- override just specific keybindings
      fzf.defaults.winopts.preview.layout = "vertical" -- horizontal|vertical|flex
			fzf.defaults.keymap.builtin["<C-d>"] = "preview-page-down"
			fzf.defaults.keymap.builtin["<C-u>"] = "preview-page-up"

			vim.keymap.set("n", "<leader>ff", fzf.files, {})
			vim.keymap.set("n", "<leader>fg", fzf.live_grep, {})
			vim.keymap.set("n", "<leader>fm", fzf.marks, {})
			vim.keymap.set("n", "<leader>gs", fzf.git_status, {})
		end,
	},
}

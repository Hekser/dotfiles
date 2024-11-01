return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
						never_show = { ".git" },
					},
					hijack_netrw_behavior = "disabled",
					use_libuv_file_watcher = true,
				},
				default_component_configs = {
					name = {
						use_git_status_colors = false, -- Prevent greying out of dotfiles
					},
				},
				window = {
					position = "right",
				},
			})

			vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>")
			vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		end,
	},
}

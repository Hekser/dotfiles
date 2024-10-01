return {
	--  {
	--    "catppuccin/nvim",
	--    name = "catppuccin",
	--    priority = 1000,
	--    opts = {
	--      transparent_background = true,
	--    },
	--    config = function(_, opts)
	--      require("catppuccin").setup(opts)
	--      vim.cmd.colorscheme("catppuccin")
	--      vim.o.background = "dark"
	--    end,
	--  },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-moon")
			vim.o.background = "dark"
		end,
	},
}

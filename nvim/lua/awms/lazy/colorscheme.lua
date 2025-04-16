return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			dark_variant = "moon",
	-- 			styles = {
	-- 				bold = true,
	-- 				italic = false,
	-- 				transparency = true,
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
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
				--   floats = "transparent",
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-night")
			vim.o.background = "dark"
		end,
	},
}

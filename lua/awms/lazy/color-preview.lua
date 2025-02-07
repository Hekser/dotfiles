return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				-- Enable colorizer for certain file types (or use "all" for all files)
				"*", -- Highlight colors in all files by default
				css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in CSS
				html = { names = true }, -- Enable named colors in HTML
			})
		end,
	},
	-- {
	-- 	"eero-lehtinen/oklch-color-picker.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	keys = {
	-- 		-- One handed keymap recommended, you will be using the mouse
	-- 		{ "<leader>v", "<cmd>ColorPickOklch<cr>", desc = "Color pick under cursor" },
	-- 	},
	-- },
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "javascript", "typescript", "lua", "rust", "html", "tsx" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}

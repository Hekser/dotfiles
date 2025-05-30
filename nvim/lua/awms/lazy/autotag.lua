return {
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"xml",
					"javascript",
					"typescript",
					"typescriptreact",
					"tsx",
					"vue",
					"svelte",
					"css",
					"scss",
					"less",
					"markdown",
					"json",
					"yaml",
					"html",
				},
			})
		end,
	},
}

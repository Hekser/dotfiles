return {
	{
		"smithbm2316/centerpad.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>Centerpad<cr>", { silent = true, noremap = true })
		end,
	},
}

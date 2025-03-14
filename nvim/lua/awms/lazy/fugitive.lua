return {
  {
    "tpope/vim-fugitive",
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", opts)
    end,
  },
}

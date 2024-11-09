return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/" },
        },
        pickers = {
          find_files = {
            hidden = true, -- Show hidden files -- TODO: not working
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          preview = {
            filesize_limit = 1, -- limits preview to files smaller than 1MB
            -- TODO: not working yet as expected
            -- treesitter = {
            --   enable = function(bufnr)
            --     -- Get file size in KB
            --     local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) / 1024
            --     -- Return false (disable) if file is larger than 100kB
            --     return file_size < 100 -- Adjust this threshold as needed
            --   end,
            -- },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

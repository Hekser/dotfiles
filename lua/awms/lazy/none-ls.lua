return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          -- TODO: launch eslint only if config detected
          -- TODO: launch prettier only if config detected
          -- TODO: add prettier code actions only if config detected
          -- TODO: eslint rules about single quotes are not align with prettier single quotes in html files & attributes
          -- null_ls.builtins.completion.spell,
          require("none-ls.diagnostics.eslint").with({ -- requires none-ls-extras.nvim
            prefer_local = "node_modules/.bin",   -- prefer local installation
          }),
          require("none-ls.code_actions.eslint"),
          null_ls.builtins.formatting.prettier.with({
            prefer_local = "node_modules/.bin", -- Use local installation first
            -- You can specify defaults for all file types
            extra_args = {
              "--single-quote",
              "--jsx-single-quote",
              "--trailing-comma",
              "es5",
              "--tab-width",
              "2",
            },
          }),
          null_ls.builtins.code_actions.prettier,
        },
        -- on_attach = function(client, bufnr)
        -- 	if client.supports_method("textDocument/formatting") then
        -- 		-- Format on save
        -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        -- 		vim.api.nvim_create_autocmd("BufWritePre", {
        -- 			group = augroup,
        -- 			buffer = bufnr,
        -- 			callback = function()
        -- 				vim.lsp.buf.format({ bufnr = bufnr })
        -- 			end,
        -- 		})
        -- 	end
        -- end,
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}

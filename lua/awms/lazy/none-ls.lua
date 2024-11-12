return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local condition = require("null-ls.utils").make_conditional_utils()

			-- Helper function to check for config files
			local function has_config_file(files)
				return condition.root_has_file(files)
			end

			-- Configure sources based on config file presence
			local sources = {
				null_ls.builtins.formatting.stylua,
			}

			-- ESLint configuration
			local eslint_files = {
				".eslintrc",
				".eslintrc.js",
				".eslintrc.json",
				".eslintrc.yaml",
				".eslintrc.yml",
        "eslint.config.js"
			}
			if has_config_file(eslint_files) then
				table.insert(
					sources,
					require("none-ls.diagnostics.eslint").with({
						prefer_local = "node_modules/.bin",
						condition = function(utils)
							return utils.root_has_file(eslint_files)
						end,
					})
				)
				table.insert(sources, require("none-ls.code_actions.eslint"))
			end

			-- Prettier configuration
			local prettier_files = {
				".prettierrc",
				".prettierrc.js",
				".prettierrc.json",
				".prettierrc.yaml",
				".prettierrc.yml",
				"prettier.config.js",
			}
			table.insert(
				sources,
				null_ls.builtins.formatting.prettier.with({
					prefer_local = "node_modules/.bin",
					-- Only run if a Prettier config exists
					-- condition = function(utils)
					-- 	return utils.root_has_file(prettier_files)
					-- end,
					-- Default options that will be overridden by .prettierrc if it exists
					extra_args = {
						"--single-quote",
						-- "--jsx-single-quote",
						"--trailing-comma",
						"es5",
						"--tab-width",
						"2",
						-- Add HTML-specific configuration to align with ESLint
						"--html-whitespace-sensitivity",
						"strict",
					},
				})
			)
			if has_config_file(prettier_files) then
				table.insert(sources, null_ls.builtins.code_actions.prettier)
			end

			null_ls.setup({
				sources = sources,
				-- Uncomment this section if you want format on save
				-- on_attach = function(client, bufnr)
				-- 	if client.supports_method("textDocument/formatting") then
				-- 		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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

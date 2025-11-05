local root_file = function(files)
	return function(_, ctx)
		local current_dir = ctx.dirname
		local top_root = nil
		while current_dir do
			for _, file in ipairs(files) do
				local target_path = current_dir .. "/" .. file
				if vim.loop.fs_stat(target_path) then
					top_root = current_dir
					break
				end
			end
			local parent = vim.fs.dirname(current_dir)
			if parent == current_dir then
				break
			end
			current_dir = parent
		end
		return top_root
	end
end

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				mix = {
					args = { "format", "--stdin-filename", "$FILENAME", "-" },
					cwd = root_file({ "mix.exs" }),
				},
				dart_format = {
					command = "dart",
					args = { "format", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				yaml = { "yamlls" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt" },
				-- elixir stuff
				elixir = { "mix" },
				eelixir = { "mix" },
				heex = { "mix" },
				surface = { "mix" },
				-- frontend
				html = { "prettierd", stop_after_first = true },
				javascript = { "prettierd", stop_after_first = true },
				typescript = { "prettierd", stop_after_first = true },
				dart = { "dart_format" },
				csharp = { "csharpier" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 2500,
				lsp_format = "fallback",
				quiet = false,
			},
		})
	end,
}

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			yaml = { "yamlls" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt" },
			-- elixir stuff
			elixir = { "mix format" },
			eelixir = { "mix format" },
			heex = { "mix format" },
			surface = { "mix format" },
			-- frontend
			html = { "prettierd", stop_after_first = true },
			javascript = { "prettierd", stop_after_first = true },
			typescript = { "prettierd", stop_after_first = true },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
			quiet = false,
		},
	},
}

local function setup_copilot_highlights()
	vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#8a8f7a", italic = true })
	vim.api.nvim_set_hl(0, "CopilotAnnotation", { fg = "#8a8f7a" })
end

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuOpen",
			callback = function()
				vim.b.copilot_suggestion_hidden = true
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuClose",
			callback = function()
				vim.b.copilot_suggestion_hidden = false
			end,
		})

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = setup_copilot_highlights,
		})
		setup_copilot_highlights()

		require("copilot").setup({
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				keymap = {
					accept = false,
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				javascript = true,
				typescript = true,
				elixir = true,
				cs = true,
				dockerfile = true,
				["*"] = false,
			},
		})
	end,
}

local function setup_copilot_highlights()
	local comment_fg = vim.api.nvim_get_hl(0, { name = "Comment", link = false }).fg
	local fallback_fg = vim.o.background == "dark" and "#8a8f7a" or "#8e8a80"
	local suggestion_fg = comment_fg and string.format("#%06x", comment_fg) or fallback_fg

	vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = suggestion_fg, italic = true })
	vim.api.nvim_set_hl(0, "CopilotAnnotation", { fg = suggestion_fg })
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

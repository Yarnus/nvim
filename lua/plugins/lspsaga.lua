return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	event = "LspAttach",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		ui = {
			-- border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
			title = true,
			winblend = 0,
			code_action = "",
		},
		hover = {
			max_width = 0.6,
			max_height = 0.6,
			open_link = "gx",
		},
		symbol_in_winbar = { enable = false },
		lightbulb = { enable = false },
		outline = { layout = "float", win_width = 60 },
		preview = { lines_above = 1, lines_below = 6 },
	},
}

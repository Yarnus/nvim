return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
		},
		use_default_keymaps = false,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["v"] = { "actions.select", opts = { vertical = true } },
			["s"] = { "actions.select", opts = { horizontal = true } },
			["<C-p>"] = "actions.preview",
			["q"] = { "actions.close", mode = "n" },
			["<C-r>"] = "actions.refresh",
			-- ["-"] = { "actions.parent", mode = "n" },
			["<leader>c"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			-- ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["<C-o>"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			-- ["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}

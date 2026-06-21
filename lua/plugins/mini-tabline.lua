return {
	"echasnovski/mini.tabline",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- Whether to show file icons (requires 'mini.icons')
		show_icons = false,
		format = nil,
		-- Where to show tabpage section in case of multiple vim tabpages.
		-- One of 'left', 'right', 'none'.
		tabpage_section = "left",
	},
	config = function(_, opts)
		require("mini.tabline").setup(opts)
	end,
}

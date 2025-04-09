return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			change_to_vcs_root = true, -- 启用切换到版本控制系统根目录
			theme = "hyper",
			config = {
				week_header = { enable = true },
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				},
				project = { enable = false },
				mru = {
					enable = false,
					limit = 5,
					icon = " ",
					label = "Most Recent Files:",
				},
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

return {
	"echasnovski/mini.tabline",
	version = "*",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		-- Whether to show file icons (requires 'mini.icons')
		show_icons = true,

		-- Function which formats the tab label
		-- By default surrounds with space and possibly prepends with icon
		format = nil,

		-- Where to show tabpage section in case of multiple vim tabpages.
		-- One of 'left', 'right', 'none'.
		tabpage_section = "left",
	},
	config = function(_, opts)
		require("mini.tabline").setup(opts)

		-- 设置与kanagawa-paper配色方案匹配的高亮组
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = "#1F1F28", bg = "#DCD7BA", italic = true })
		vim.api.nvim_set_hl(0, "MiniTablineVisible", { fg = "#DCD7BA", bg = "#363646" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = "#C8C093", bg = "#2A2A37" })
		vim.api.nvim_set_hl(0, "MiniTablineFill", { fg = "none", bg = "none" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = "#1F1F28", bg = "#DCD7BA", italic = true })
	end,
}

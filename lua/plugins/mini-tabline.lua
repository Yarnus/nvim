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

		-- 设置与kanagawa-paper配色方案匹配的高亮组
		vim.api.nvim_set_hl(0, "MiniTablineFill", { fg = "", bg = "#eeeeee" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = "#eeeeee", bg = "#7FB4CA", italic = false, bold = true })
		vim.api.nvim_set_hl(0, "MiniTablineVisible", { fg = "#8e908c", bg = "#eeeeee", italic = true })
		vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = "#8e908c", bg = "#eeeeee", italic = true })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = "#DCA561", bg = "#eeeeee", bold = true })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { fg = "#DCA561", bg = "#eeeeee", bold = true })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { fg = "#DCA561", bg = "#eeeeee", bold = true })
	end,
}

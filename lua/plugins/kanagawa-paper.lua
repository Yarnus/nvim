return {
	"thesimonho/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local kanagawa_paper_theme = "ink" -- "ink" for dark, "canvas" for light

		require("kanagawa-paper").setup({
			-- enable undercurls for underlined text
			undercurl = true,
			-- transparent background
			transparent = true,
			-- highlight background for the left gutter
			gutter = false,
			-- background for diagnostic virtual text
			diag_background = true,
			-- dim inactive windows. Disabled when transparent
			dim_inactive = false,
			-- set colors for terminal buffers
			terminal_colors = true,
			-- cache highlights and colors for faster startup.
			-- see Cache section for more details.
			cache = false,

			styles = {
				-- style for comments
				comment = { italic = true },
				-- style for functions
				functions = { italic = false, bold = true },
				-- style for keywords
				keyword = { italic = false, bold = false },
				-- style for statements
				statement = { italic = false, bold = false },
				-- style for types
				type = { italic = false },
			},
			-- override default palette and theme colors
			colors = {
				palette = {},
				theme = {
					ink = {},
					canvas = {},
				},
			},
			-- adjust overall color balance for each theme [-1, 1]
			color_offset = {
				ink = { brightness = 0, saturation = 0 },
				canvas = { brightness = 0, saturation = 0 },
			},
			-- override highlight groups
			overrides = function(colors)
				local theme = colors.theme
				return {
					Pmenu = { fg = theme.ui.pmenu.fg, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },
					-- 主体背景 & 文本
					SagaNormal = {
						bg = theme.ui.float.bg,
						fg = theme.ui.float.fg,
					},
					SagaBorder = {
						bg = theme.ui.float.bg,
						fg = theme.ui.float.fg_border,
					},
					SagaTitle = {
						bg = theme.ui.float.bg,
						fg = theme.syn.identifier, -- crystalBlue 系的函数色
						bold = true,
					},
					SagaBeacon = { bg = theme.ui.bg_p2, fg = theme.ui.fg },
					["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
					["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
					["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
					["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
					["@markup.list.markdown"] = { link = "Function" }, -- + list
					["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
					["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
				}
			end,

			-- uses lazy.nvim, if installed, to automatically enable needed plugins
			auto_plugins = true,
			-- enable highlights for all plugins (disabled if using lazy.nvim)
			all_plugins = package.loaded.lazy == nil,
			-- manually enable/disable individual plugins.
			-- check the `groups/plugins` directory for the exact names
			plugins = {
				-- examples:
				-- rainbow_delimiters = true
				-- which_key = false
			},

			-- enable integrations with other applications
			integrations = {
				-- automatically set wezterm theme to match the current neovim theme
				wezterm = {
					enabled = false,
					-- neovim will write the theme name to this file
					-- wezterm will read from this file to know which theme to use
					path = (os.getenv("TEMP") or "/tmp") .. "/nvim-theme",
				},
			},
		})

		vim.cmd.colorscheme("kanagawa-paper-" .. kanagawa_paper_theme)
		if kanagawa_paper_theme == "canvas" then
			vim.cmd([[
				"highlight! NormalFloat guibg=#e6e2cd guifg=#1f1f28
				"highlight! FloatBorder guibg=#e6e2cd guifg=#9cabca
				highlight! Statusline guibg=#eeeeee
				highlight! NormalFloat guibg=#dcddc8 guifg=#1f1f28
			]])
		end
	end,
}

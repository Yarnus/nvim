return {
	"thesimonho/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	config = function()
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
					-- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					-- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

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

		vim.cmd.colorscheme("kanagawa-paper-canvas")
	end,
}

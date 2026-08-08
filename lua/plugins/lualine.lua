return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local function get_colors()
			local theme = require("kanagawa-paper.colors").setup().theme

			return {
				red = theme.diag.error,
				orange = theme.accent.accent2,
				yellow = theme.diag.warning,
				green = theme.diag.ok,
				cyan = theme.diag.hint,
				blue = theme.modes.normal,
				violet = theme.modes.visual,
				magenta = theme.syn.keyword,
				teal = theme.syn.type,
			}
		end

		local function component_color(name)
			return function()
				return { fg = get_colors()[name], bg = "NONE" }
			end
		end

		local function lualine_theme()
			local variant = vim.o.background == "dark" and "ink" or "canvas"
			local theme = vim.deepcopy(require("lualine.themes.kanagawa-paper-" .. variant))

			for mode_name, mode in pairs(theme) do
				for section_name, section in pairs(mode) do
					if section_name == "a" and mode_name ~= "inactive" then
						section.fg = section.bg
					end
					section.bg = "NONE"
				end
			end

			return theme
		end

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				icons_enabled = true,
				theme = lualine_theme,
				globalstatus = true,
				ignore_focus = { "NvimTree" },
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			function()
				return "▊"
			end,
			color = component_color("blue"), -- Sets highlighting of component
			padding = { left = 0, right = 1 }, -- We don't need space before this
		})

		ins_left({
			-- mode component
			function()
				return ""
			end,
			color = function()
				-- auto change color according to neovims mode
				local colors = get_colors()
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1 },
		})

		ins_left({
			"branch",
			icon = "",
			color = component_color("magenta"),
			-- separator           = '❯',
		})

		ins_left({
			"diff",
			-- Is it me or the symbol for modified us really weird
			symbols = { added = "  ", modified = "  ", removed = "  " },
			diff_color = {
				added = component_color("green"),
				modified = component_color("orange"),
				removed = component_color("red"),
			},
			cond = conditions.hide_in_width,
		})

		-- 0: Just the filename
		-- 1: Relative path
		-- 2: Absolute path
		-- 3: Absolute path, with tilde as the home directory
		-- 4: Filename and parent dir, with tilde as the home directory
		ins_left({
			"filename",
			path = 3,
			file_status = false,
			cond = conditions.buffer_not_empty,
			-- color = { fg = colors.fg, fg = colors.bg, gui = "" },
			color = component_color("yellow"),
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			cond = conditions.hide_in_width,
			symbols = { error = "  ", warn = "  ", info = "  " },
		})

		-- Insert mid section. You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
		ins_left({
			function()
				return "%="
			end,
		})

		ins_right({
			-- Lsp server name .
			function()
				local msg = "nil"
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = " lsp:",
			color = component_color("teal"),
		})

		-- Add components to right sections

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
			color = component_color("red"),
		})

		-- ins_right({
		-- 	"o:encoding", -- option component same as &encoding in viml
		-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
		-- 	cond = conditions.hide_in_width,
		-- 	color = { fg = colors.brown, gui = "" },
		-- })
		--
		-- ins_right({
		-- 	"filesize",
		-- 	color = { fg = colors.teal },
		-- 	cond = conditions.buffer_not_empty,
		-- })
		--
		ins_right({ "progress", color = component_color("green") })

		ins_right({
			function()
				return "▊"
			end,
			color = component_color("blue"),
			padding = { left = 1 },
		})

		lualine.setup(config)
	end,
}

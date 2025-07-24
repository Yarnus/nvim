return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local merge_table = function(t1, t2)
			for k, v in pairs(t2) do
				t1[k] = v
			end
			return t1
		end

		local default_colors = {}

		local extra_colors = {
			red = "#C34043",
			redwine = "#43242B",
			orange = "#FFA066",
			yellow = "#DCA561",
			lignt_orange = "#FF9E64",
			green = "#76946A",
			dark_green = "#98BB6C",
			cyan = "#7FB4CA",
			blue = "#7E9CD8",
			violet = "#957FB8",
			magenta = "#938AA9",
			teal = "#6A9589",
			grey = "#727169",
			brown = "#727169",
			-- 来自MiniTablineHidden的背景色
			bg = "#2A2A37",
			-- 来自MiniTablineVisible的前景色
			fg = "#DCD7BA",
		}

		local colors = merge_table(default_colors, extra_colors)

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
				theme = {
					normal = {
						a = { fg = "#005faf", bg = "NONE" },
						b = { fg = "#444444", bg = "NONE" },
						c = { fg = "#444444", bg = "NONE" },
					},
					insert = {
						a = { fg = "#008700", bg = "NONE" },
						b = { fg = "#444444", bg = "NONE" },
						c = { fg = "#444444", bg = "NONE" },
					},
					visual = {
						a = { fg = "#d75f00", bg = "NONE" },
						b = { fg = "#444444", bg = "NONE" },
						c = { fg = "#444444", bg = "NONE" },
					},
					replace = {
						a = { fg = "#af0000", bg = "NONE" },
						b = { fg = "#444444", bg = "NONE" },
						c = { fg = "#444444", bg = "NONE" },
					},
					command = {
						a = { fg = "#5f8700", bg = "NONE" },
						b = { fg = "#444444", bg = "NONE" },
						c = { fg = "#444444", bg = "NONE" },
					},
					inactive = {
						a = { fg = "#444444", bg = "NONE" },
						b = { fg = "#444444", bg = "NONE" },
						c = { fg = "#444444", bg = "NONE" },
					},
				},
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
			color = { fg = colors.blue }, -- Sets highlighting of component
			padding = { left = 0, right = 1 }, -- We don't need space before this
		})

		ins_left({
			-- mode component
			function()
				return ""
			end,
			color = function()
				-- auto change color according to neovims mode
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
			color = { fg = colors.magenta, gui = "" },
			-- separator           = '❯',
		})

		ins_left({
			"diff",
			-- Is it me or the symbol for modified us really weird
			symbols = { added = "  ", modified = "  ", removed = "  " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
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
			color = { fg = colors.yellow, bg = "none" },
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			cond = conditions.hide_in_width,
			symbols = { error = "  ", warn = "  ", info = "  " },
			diagnostics_color = {
				color_error = { fg = colors.red, bg = "NONE" },
				color_warn = { fg = colors.yellow, bg = "NONE" },
				color_info = { fg = colors.cyan, bg = "NONE" },
			},
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
			color = { fg = colors.teal, gui = "" },
		})

		-- Add components to right sections

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
			color = { fg = colors.red, gui = "" },
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
		ins_right({ "progress", color = { fg = colors.green, gui = "" } })

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 1 },
		})

		lualine.setup(config)
	end,
}

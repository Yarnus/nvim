local winopts = {
	height = 0.85, -- window height
	width = 0.80, -- window width
	row = 0.35, -- window row position (0=top, 1=bottom)
	col = 0.50,
	border = "rounded",
	treesitter = {
		enabled = true,
		fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
	},
	preview = {
		layout = "flex",
		border = "rounded",
		warp = true,
		title = false,
		scrollbar = false,
		delay = 20,
		-- builtin previewer window options
		winopts = {
			number = true,
			relativenumber = false,
			cursorline = true,
			cursorlineopt = "both",
			cursorcolumn = false,
			signcolumn = "no",
			list = false,
			foldenable = false,
			foldmethod = "manual",
		},
	},
}

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		file_icon_padding = "",
		winopts = winopts,
		actions = {
			-- files = {
			--   ["enter"]  = "file_switch_or_edit",
			--   ["ctrl-e"] = "file_vsplit",
			-- },
		},
		hls = {
			preview_border = "Normal",
			preview_title = "Title",
			prompt = "Directory",
			cursor_line = "CursorLine",
			cursor = "Cursor",
			scrollbar_thumb = "PmenuThumb",
		},
		keymap = {
			fzf = {
				["tab"] = "down", -- 原Tab键映射为下移
				["shift-tab"] = "up", -- 原Shift-Tab映射为上移
				["ctrl-m"] = "toggle-all", -- 可选：将多选功能转移到其他键
			},
		},
		fzf_opts = {
			-- 自定义指示器样式
			["--ansi"] = true,
			["--style"] = "minimal",
			["--info"] = "inline-right", -- fzf < v0.42 = "inline"
			["--height"] = "100%",
			["--layout"] = "reverse",
			["--border"] = "none",
			["--highlight-line"] = true, -- fzf >= v0.53
			-- ['--pointer']        = '➜', -- 当前选中项的指示器
			["--marker"] = "✓", -- 多选时的标记符号
		},
	},
	keys = {
		{
			"<C-p>",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in project directory",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find by grepping in project directory",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in neovim configuration",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [B]uiltin FZF",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind current [W]ord",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[F]ind current [W]ORD",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "[F]ind [R]esume",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [O]ld Files",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[,] Find existing buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep the current buffer",
		},
	},
}

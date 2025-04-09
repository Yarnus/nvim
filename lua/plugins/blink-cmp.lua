return {

	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
			-- "ray-x/cmp-sql",
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap

			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				-- 	-- disable a keymap from the preset
				-- ["<C-e>"] = {},
				-- 	-- show with a list of providers
				-- 	["<C-space>"] = {
				-- 		function(cmp)
				-- 			cmp.show({ providers = { "snippets" } })
				-- 		end,
				-- 	},
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = true },
				accept = {
					auto_brackets = {
						enabled = true,
						default_brackets = { "(", ")" },
						override_brackets_for_filetypes = {},
						kind_resolution = {
							enabled = true,
							blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
						},
						semantic_token_resolution = {
							enabled = true,
							blocked_filetypes = { "java" },
							timeout_ms = 400,
						},
					},
				},
				list = {
					selection = { preselect = true, auto_insert = false },
					cycle = { from_bottom = true },
				},
				menu = {
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "label", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
					},
				},
			},
			signature = { enabled = true },

			-- accept = { auto_brackets = { enabled = false } },
			-- list = { selection = { preselect = false, auto_insert = true } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					snippets = { min_keyword_length = 3, async = true },
					lsp = { min_keyword_length = 0, async = true },
					buffer = { min_keyword_length = 2 },
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

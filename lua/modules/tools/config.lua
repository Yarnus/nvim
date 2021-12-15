local config = {}

function config.telescope()
    local home = os.getenv("HOME")

    if not packer_plugins["popup.nvim"].loaded then
        vim.cmd [[packadd popup.nvim]]
    end

    if not packer_plugins["telescope-fzf-native.nvim"].loaded then
        vim.cmd [[packadd telescope-fzf-native.nvim]]
    end

    if not packer_plugins["telescope-project.nvim"].loaded then
        vim.cmd [[packadd telescope-project.nvim]]
    end

    if not packer_plugins["sqlite.lua"].loaded then
        vim.cmd [[packadd sqlite.lua]]
    end

    if not packer_plugins["telescope-frecency.nvim"].loaded then
        vim.cmd [[packadd telescope-frecency.nvim]]
    end

    if not packer_plugins["telescope-media-files.nvim"].loaded then
        vim.cmd [[packadd telescope-media-files.nvim]]
    end


    require("telescope").setup {
        defaults = {
            prompt_prefix = "🔭 ",
            selection_caret = " ",
            layout_config = {
                horizontal = {prompt_position = "bottom", results_width = 0.6},
                vertical = {mirror = false}
            },
            file_previewer = require"telescope.previewers".vim_buffer_cat.new,
            grep_previewer = require"telescope.previewers".vim_buffer_vimgrep
                .new,
            qflist_previewer = require"telescope.previewers".vim_buffer_qflist
                .new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"absolute"},
            winblend = 0,
            border = {},
            borderchars = {
                "─", "│", "─", "│", "╭", "╮", "╯", "╰"
            },
            color_devicons = true,
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"}
        },
        extensions = {
            fzf = {
                fuzzy = false,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            },
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = {"*.git/*", "*/tmp/*"},
                workspaces = {
                    ["conf"] = home .. "/.config",
                    ["data"] = home .. "/.local/share",
                    ["nvim"] = home .. "/.config/nvim",
                    ["code"] = home .. "/code",
                    ["c"] = home .. "/code/c",
                    ["cpp"] = home .. "/code/cpp",
                    ["go"] = home .. "/go/src",
                    ["rust"] = home .. "/code/rs"
                }
            },
            media_files = {
                filetypes = {"png", "webp", "jpg", "jpeg", "pdf"},
                find_cmd = "fd"
            }
        }
    }

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("project")
    require("telescope").load_extension("frecency")
    require("telescope").load_extension("media_files")

end


return config

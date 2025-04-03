return {
    {
        "windwp/nvim-autopairs",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")

            npairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { "string" },
                    java = false,
                },
                disable_filetype = { "TelescopePrompt", "vim" },
                fast_wrap = {
                    map = "<M-e>",
                    chars = { "{", "[", "(", '"', "'" },
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                    end_key = "$",
                    keys = "qwertyuiopzxcvbnmasdfghjkl",
                    check_comma = true,
                    highlight = "Search",
                    highlight_grey = "Comment"
                },
            })

            -- 与blink.cmp集成
            local ok, blink = pcall(require, "blink.cmp")
            if ok and blink and blink.event then
                blink.event:on("confirm_done", function()
                    local npairs = require("nvim-autopairs")
                    npairs.autopairs_cr()
                end)
            end

            -- 添加一些自定义规则
            npairs.add_rules({
                Rule("$", "$", { "tex", "latex" }),
                Rule("`", "`", { "markdown" })
            })
        end,
    },
}

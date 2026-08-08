local function yaml_icons()
	local color = require("kanagawa-paper.colors").setup().theme.diag.error

	return {
		yml = {
			icon = "",
			color = color,
			name = "Yaml",
		},
		yaml = {
			icon = "",
			color = color,
			name = "Yaml",
		},
	}
end

return {
	"nvim-tree/nvim-web-devicons",
	opts = function()
		return { override_by_extension = yaml_icons() }
	end,
	config = function(_, opts)
		local devicons = require("nvim-web-devicons")
		devicons.setup(opts)

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("DynamicDeviconColors", { clear = true }),
			callback = function()
				devicons.set_icon(yaml_icons())
			end,
		})
	end,
}

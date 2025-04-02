local set = vim.keymap.set

local cmd = function(str)
	return "<cmd>" .. str .. "<CR>"
end

set("n", "<C-n>", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

set("n", "<leader>gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- custom
set("n", "<esc>", ":noh<return><esc>")
set("n", "<C-s>", cmd("write"))
set("i", "<C-a>", "<Home>")
set("i", "<C-e>", "<End>")
set("c", "<C-a>", "<Home>")
set("c", "<C-e>", "<End>")

-- windows
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")
set("n", "<C-h>", "<C-w>h")
set("n", "<C-up>", cmd(":res -5"))
set("n", "<C-down>", cmd(":res +5"))
set("n", "<C-left>", cmd(":vertical resize -5"))
set("n", "<C-right>", cmd(":vertical resize +5"))

-- buffer
set("n", "-", cmd(":bd"), { desc = "Buffer Delete" })
set("n", "=", cmd(":bn"), { desc = "Buffer New" })
set("n", "<Tab>", cmd(":bnext"), { desc = "Next Buffer" })
set("n", "<S-Tab>", cmd(":bprevious"), { desc = "Previous Buffer" })

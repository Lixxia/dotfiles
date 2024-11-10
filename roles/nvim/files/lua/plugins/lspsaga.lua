return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "LspAttach",
	config = function()
		local lspsaga = require("lspsaga")

		lspsaga.setup({
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
			definition = {
				edit = "<CR>",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}

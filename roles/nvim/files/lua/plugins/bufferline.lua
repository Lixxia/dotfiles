return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<A-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<A-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Prev Buffer" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				separator_style = { "", "" },
				indicator = {
					icon = " ",
					style = "icon",
				},
				diagnostics = "nvim_lsp",
				offsets = {
					{
						separator = " ",
						highlight = "NvimTreeNormal",
						filetype = "NvimTree",
						text = "",
						text_align = "center",
					},
				},
			},
		})
	end,
}

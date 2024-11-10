return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				indent_blankline = { enabled = true },
				mason = true,
				markdown = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}

require("catppuccin").setup ({
  custom_highlights = function(colors)
    return {
      	BufferCurrent = { bg = colors.none, fg = colors.text },
		BufferCurrentIndex = { bg = colors.none, fg = colors.blue },
		BufferCurrentMod = { bg = colors.none, fg = colors.yellow },
		BufferCurrentSign = { bg = colors.none, fg = colors.blue },
		BufferCurrentTarget = { bg = colors.none, fg = colors.red },
		BufferVisible = { bg = colors.none, fg = colors.text },
		BufferVisibleIndex = { bg = colors.none, fg = colors.blue },
		BufferVisibleMod = { bg = colors.none, fg = colors.yellow },
		BufferVisibleSign = { bg = colors.none, fg = colors.blue },
		BufferVisibleTarget = { bg = colors.none, fg = colors.red },
		BufferInactive = { bg = colors.none, fg = colors.overlay0 },
		BufferInactiveIndex = { bg = colors.none, fg = colors.overlay0 },
		BufferInactiveMod = { bg = colors.none, fg = colors.yellow },
		BufferInactiveSign = { bg = colors.none, fg = colors.blue },
		BufferInactiveTarget = { bg = colors.none, fg = colors.red },
		BufferTabpages = { bg = colors.none, fg = colors.none },
		BufferTabpage = { bg = colors.none, fg = colors.blue },
    }
  end,
  transparent_background = true,
  term_colors = true,
  styles = {
  	comments =  { "italic" },
  	functions = { "italic" },
  	keywords = { "italic" },
  	strings = {},
  	variables = { "italic" },
  },
  integrations = {
  	gitgutter = true,
  	nvimtree = {
  		enabled = true,
  		show_root = false,
  	},
    barbar = true,
  }
})

vim.cmd.colorscheme "catppuccin"

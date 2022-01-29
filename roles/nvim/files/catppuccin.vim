lua << EOF
require'catppuccin'.setup {
transparent_background = true,
term_colors = true,
styles = {
	comments = "italic",
	functions = "italic",
	keywords = "italic",
	strings = "NONE",
	variables = "italic",
},
integrations = {
	gitgutter = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = true,
	},
}
}
EOF

colorscheme catppuccin

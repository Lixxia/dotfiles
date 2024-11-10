return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = {
					prefix = "▎", -- Could be '●', '▎', 'x'
				},
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- [mason_server_name] = setup_fn
			local servers = {
				["ansible-language-server"] = function()
					lspconfig["ansiblels"].setup({ capabilities = capabilities })
				end,
				["bash-language-server"] = function()
					lspconfig["bashls"].setup({ capabilities = capabilities })
				end,
				["tflint"] = function()
					lspconfig["tflint"].setup({ capabilities = capabilities })
				end,
				["pyright"] = function()
					lspconfig["pyright"].setup({ capabilities = capabilities })
				end,
				["yaml-language-server"] = function()
					lspconfig["yamlls"].setup({ capabilities = capabilities })
				end,
			}

			local mason_registry = require("mason-registry")
			for mason_server_name, setup_fn in pairs(servers) do
				if not mason_registry.is_installed(mason_server_name) then
					vim.cmd("MasonInstall " .. mason_server_name)
				end
				setup_fn()
			end
		end,
	},
}

return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")
		local function setup(name, config)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			config.on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end
			require("lspconfig")[name].setup(config)
		end
		local servers = {
			["lua_ls"] = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
					},
				},
			},
			["clangd"] = {},
			["pyright"] = {},
			["html-lsp"] = {},
			["css-lsp"] = {},
		}
		for server, config in pairs(servers) do
			setup(server, config)
		end
		vim.cmd("LspStart")
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
		})
	end,
}

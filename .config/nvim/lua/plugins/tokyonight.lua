return {
	"folke/tokyonight.nvim",
	opts = {
		--style = "midnight",
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}


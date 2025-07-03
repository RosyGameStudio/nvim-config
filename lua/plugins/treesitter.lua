return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
	require("nvim-treesitter.configs").setup({
		prefer_git = false,
		compilers = { "cl" },
		ensure_installed = { "c", "cpp", "lua" },
		
		highlight = {
			enable = true,
		},
		
		indent = {
			enable = true,
		},
		
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	})
	end,
}

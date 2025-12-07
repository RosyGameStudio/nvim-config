return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
        require("nvim-treesitter.configs").setup({
            prefer_git = false,
            compilers = { "clang", "cl" },
            ensure_installed = { "c", "cpp", "lua", "go", "python", "json", "jsonc", "markdown", "vimdoc" },

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
                disable = {"c"},
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

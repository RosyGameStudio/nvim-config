local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--header-insertion=iwyu',
	},
	filetypes = {'c', 'cpp'},
	root_markers = {'compile_commands.json', '.git'},
	capabilities = capabilities,
}

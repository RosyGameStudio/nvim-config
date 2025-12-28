local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Disable additionalTextEdits to prevent any sneaky header insertions
capabilities.textDocument.completion.completionItem.additionalTextEditsSupport = false

return {
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--header-insertion=never',
		'--header-insertion-decorators=0',
	},
	filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda'},
	root_markers = {'compile_commands.json', '.git'},
	capabilities = capabilities,
}

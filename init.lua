-- for nvim-tree, disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
require("config.lazy")

vim.lsp.enable('clangd')
-- lsp
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show error' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
-- nvim-tree
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

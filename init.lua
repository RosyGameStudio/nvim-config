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
vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, { desc = 'Code action' })
-- nvim-tree
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
-- terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc = 'Open terminal in horizontal split' })
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', { desc = 'Open terminal in vertical split' })
--build & debug
vim.keymap.set('n', '<F5>', ':!build.bat<CR>', { desc = 'Run build.bat' })
vim.keymap.set('n', '<S-F5>', ':!debug.bat<CR>', { desc = 'Run debug.bat' })
-- docs
vim.keymap.set('n', '<leader>hc', function()
  vim.fn.system('start https://learn.microsoft.com/en-us/cpp/c-language/?view=msvc-170')
end, { desc = 'Open C language docs' })
vim.keymap.set('n', '<leader>hv', function()
  vim.fn.system('start https://registry.khronos.org/vulkan/specs/latest/html/vkspec.html')
end, { desc = 'Open C language docs' })

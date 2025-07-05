-- for nvim-tree, disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true
require("config.lazy")

vim.lsp.enable('clangd')

-- general
--
vim.keymap.set('n', '<leader>es', function()
    vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua')
end, { desc = 'Edit Neovim settings' })
vim.keymap.set(
    'n', '<leader>er',
    '<cmd>source ' .. vim.fn.stdpath('config') .. '/init.lua<cr>', 
    { desc = 'Reload settings' })

-- lsp

vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, { desc = 'Show error' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.type_definition, { desc = 'Type definition' })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

-- nvim-tree

vim.keymap.set('n', '<leader>no', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

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

vim.keymap.set('n', '<leader>hb', function()
  vim.fn.system('start https://learn.microsoft.com/en-us/cpp/build/reference/compiler-command-line-syntax?view=msvc-170')
end, { desc = 'Open CL docs' })

vim.keymap.set('n', '<leader>hs', function()
  vim.fn.system('start https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3220.pdf')
end, { desc = 'Open C Spec' })

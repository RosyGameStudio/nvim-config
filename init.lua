-- my modules
require("build_helper")
-- for nvim-tree, disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.editorconfig = true

-- local configs
vim.opt.exrc = true
vim.opt.secure = false

-- tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fileformat = "unix"

vim.opt.termguicolors = true
vim.g.neovide_scale_factor = 0.8
-- vim.o.guifont = "Source Code Pro:h12"
require("config.lazy")

vim.lsp.enable('clangd')
vim.lsp.enable('slangd')
vim.lsp.enable('gopls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')

-- c indentation fixes
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.indentexpr = ""
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = ":0,l1"
    end
})

-- Set LSP log level to reduce verbosity
vim.lsp.set_log_level("warn") -- Options: "trace", "debug", "info", "warn", "error", "off"

-- disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

vim.diagnostic.config({ jump = { float = true } })
vim.lsp.config('python', {})
vim.lsp.config('lua', {})
vim.lsp.config('slangd', {
    cmd = { 'slangd' },
    filetypes = { 'hlsl', 'shaderslang' },
    root_markers = { '.git' },
    settings = {
        slang = {
            predefinedMacros = { "MY_VALUE_MACRO=1" },
            inlayHints = {
                deducedTypes = true,
                parameterNames = true,
            }
        }
    }
})

vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        }
    }
})

-- general

-- open settings
vim.keymap.set('n', '<leader>es', function()
    vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua')
end, { desc = 'Edit Neovim settings' })

vim.keymap.set(
    'n', '<leader>er',
    '<cmd>source ' .. vim.fn.stdpath('config') .. '/init.lua<cr>',
    { desc = 'Reload settings' })

for i = 1, 9 do
    vim.keymap.set('n', '<leader>' .. i, '<Cmd>BufferGoto ' .. i .. '<CR>', { desc = 'Go to buffer ' .. i })
end

vim.keymap.set('n', '<Esc>', function()
    vim.cmd('nohl')
    return '<Esc>'
end, { expr = true })

-- lsp

vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, { desc = 'Show error' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { desc = 'Type definition' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, { desc = 'lsp hover' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

-- nvim-tree

vim.keymap.set('n', '<leader>no', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer' })

-- terminal mode

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<leader>ti', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>ti', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc = 'Open terminal in horizontal split' })
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', { desc = 'Open terminal in vertical split' })

-- buffer navigation

vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<A-S-Tab>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move buffer left' })
vim.keymap.set('n', '<A-Tab>', '<Cmd>BufferMoveNext<CR>', { desc = 'Move buffer right' })

-- split

vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })

-- window navigation

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to up window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- window resize

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- better indenting (stay in visual mode)

vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- move lines up/down

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- claude
vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Open Claude Code' })

-- telescope

local t_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', t_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', t_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', t_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', t_builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>lr', t_builtin.lsp_references, { desc = 'Telescope lsp references' })
vim.keymap.set('n', '<leader>ld', t_builtin.lsp_definitions, { desc = 'Telescope lsp definitions' })
vim.keymap.set('n', '<leader>lt', t_builtin.lsp_type_definitions, { desc = 'Telescope lsp type definitions' })
vim.keymap.set('n', '<leader>li', t_builtin.lsp_implementations, { desc = 'Telescope lsp implementations' })

vim.keymap.set('n', '<leader>f?', t_builtin.search_history, { desc = 'Telescope search history' })

vim.keymap.set('n', '<leader>vs', t_builtin.git_status, { desc = 'Telescope git status' })

vim.keymap.set('n', '<leader>bf', t_builtin.current_buffer_fuzzy_find, { desc = 'Telescope current buffer fuzzy find' })

vim.keymap.set('n', '<leader>ch', t_builtin.command_history, { desc = 'Telescope command history' })

-- macOS paste (Cmd+V)
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true })
vim.keymap.set('i', '<D-v>', '<C-r>+', { noremap = true })
vim.keymap.set('c', '<D-v>', '<C-r>+', { noremap = true })
vim.keymap.set('v', '<D-v>', '"+p', { noremap = true })

-- macOS copy (Cmd+C)
vim.keymap.set('v', '<D-c>', '"+y', { noremap = true })

-- Windows/Linux copy and paste (Ctrl+C, Ctrl+V)
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true })
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true })
vim.keymap.set('v', '<C-v>', '"+p', { noremap = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true })
vim.keymap.set('c', '<C-v>', '<C-r>+', { noremap = true })

--build & debug

-- vim.keymap.set('n', '<F5>', ':!build.bat RELEASE<CR>', { desc = 'Run build.bat' })
-- vim.keymap.set('n', '<F6>', ':!build.bat DEBUG<CR>', { desc = 'Run build.bat' })
-- vim.keymap.set('n', '<S-F5>', ':!debug.bat<CR>', { desc = 'Run debug.bat' })

-- docs

vim.keymap.set('n', '<leader>hc', function()
    vim.fn.system('start https://learn.microsoft.com/en-us/cpp/c-language/?view=msvc-170')
end, { desc = 'Open C language docs' })

vim.keymap.set('n', '<leader>hv', function()
    vim.fn.system('start https://registry.khronos.org/vulkan/specs/latest/html/vkspec.html')
end, { desc = 'Open C language docs' })

vim.keymap.set('n', '<leader>hb', function()
    vim.fn.system(
        'start https://learn.microsoft.com/en-us/cpp/build/reference/compiler-command-line-syntax?view=msvc-170')
end, { desc = 'Open CL docs' })

vim.keymap.set('n', '<leader>hs', function()
    vim.fn.system('start https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3220.pdf')
end, { desc = 'Open C Spec' })

-- autocmds

-- clean trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

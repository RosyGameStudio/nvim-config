return {
    "greggh/claude-code.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
        require("claude-code").setup({
            -- Terminal window settings
            window = {
                split_ratio = 0.5,      -- Take exactly half the screen width
                position = "vertical",  -- Creates a vertical split (appears on the right)
                enter_insert = true,    -- Auto-enter insert mode for immediate typing
                hide_numbers = true,    -- Clean terminal look without line numbers
                hide_signcolumn = true, -- No sign column for cleaner appearance
            },

            -- File refresh settings
            refresh = {
                enable = true,           -- Auto-detect when files change
                updatetime = 100,        -- Fast response time
                timer_interval = 500,    -- Check for changes every 500ms (balanced)
                show_notifications = true, -- Know when files are reloaded
            },

            -- Git project settings
            git = {
                use_git_root = true,     -- Automatically use git root as working directory
            },

            -- Shell-specific settings (defaults are fine for most shells)
            shell = {
                separator = '&&',
                pushd_cmd = 'pushd',
                popd_cmd = 'popd',
            },

            -- Command settings
            command = "claude",        -- Standard claude command

            -- Command variants for different use cases
            command_variants = {
                continue = "--continue",
                resume = "--resume",
                verbose = "--verbose",
            },

            -- Keymaps for productivity
            keymaps = {
                toggle = {
                    normal = "<leader>cc",     -- Quick toggle with leader+cc
                    terminal = "<C-\\><C-n>",  -- Escape from terminal mode
                    variants = {
                        continue = "<leader>cC", -- Continue last conversation
                        verbose = "<leader>cv",  -- Verbose mode for debugging
                    },
                },
                window_navigation = true,  -- Use C-h/j/k/l to move between windows
                scrolling = true,          -- C-f/b for page navigation in terminal
            }
        })
    end
}

return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'benfowler/telescope-luasnip.nvim',
  },

  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "vendor/.*",
          "external\\.*",
          "node_modules/.*",
          "SPIRV-Headers/",
          "%.git/.*",
          "%.git\\.*",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    telescope.load_extension('luasnip')
  end,
}

return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require("telescope").setup({
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
    })
  end,
}

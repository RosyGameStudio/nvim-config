return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ bufnr = vim.api.nvim_get_current_buf(), async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      lua = { "stylua" },
      go = { "gofmt" },
      python = { "black" },
      json = { "prettier" },
      markdown = { "prettier" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      clang_format = {
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

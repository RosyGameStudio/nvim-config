return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "clangd", "gopls", "lua_ls", "pyright", "jsonls" },
      automatic_installation = true,
    },
  },
}

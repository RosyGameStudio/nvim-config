
return {
    "SmiteshP/nvim-navic",
    config = function()
        local navic = require("nvim-navic")

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, args.buf)
                end
            end,
        })
    end
}

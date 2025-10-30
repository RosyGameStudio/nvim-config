return {
    'numToStr/FTerm.nvim',
    config = function()
        require('FTerm').setup({
            cmd = 'cmd',
            border = 'rounded',
            hl = 'Normal',
            dimensions = {
                height = 0.8,
                width = 0.8,
            },
            blend = 10,
        })
    end
}

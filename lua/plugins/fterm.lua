
return {
    'numToStr/FTerm.nvim',
        config = function()
	local term_opt = 'cmd'
	if vim.fn.has('mac') == 1 then
		term_opt = 'zsh'
	end
        require('FTerm').setup({
            cmd = term_opt,
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


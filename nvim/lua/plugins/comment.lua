return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		local api = require('Comment.api')
		vim.keymap.set({'n', 'v'}, '<leader>;', api.call('toggle.linewise', 'g@'), { expr = true })
	end
}

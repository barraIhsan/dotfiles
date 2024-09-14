-- highlight when yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- auto-indent html and astro files using vim's `=` on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.html", "*.astro" },
	callback = function()
		local cursor = vim.api.nvim_win_get_cursor(0)
		vim.cmd("normal! gg=G")
		vim.api.nvim_win_set_cursor(0, cursor)
	end,
})

-- highlight when yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- apply chezmoi changes when saving a file
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Apply chezmoi changes after saving any file in the ~/.local/share/chezmoi directory",
  pattern = vim.fn.expand("~") .. "/.local/share/chezmoi/*",
  callback = function()
    vim.fn.system("chezmoi apply --force --source-path " .. vim.fn.expand("%"))
  end,
})

-- add hyphen (-) to `isKeyword` on html, and react
-- for css class especially tailwind
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

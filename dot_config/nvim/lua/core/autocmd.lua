-- highlight when yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- disable double left mouse click on help page to
-- jump to tag. The same as Ctrl-]. Instead it will
-- highlight current word like in any filetype.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "<2-LeftMouse>", "viw", { buffer = true, noremap = true })
  end,
})

-- apply chezmoi changes when saving a file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~") .. "/.local/share/chezmoi/*",
  callback = function()
    vim.system({ "chezmoi", "apply", "--force", "--source-path", vim.fn.expand("%") })
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

-- add colorcolumn on gitcommit file
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.colorcolumn = "50,72"
  end,
})

-- disable signcolumn on manpages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    vim.opt_local.signcolumn = "no"
  end,
})

-- telescope/plenary new winborder workaround
-- See https://github.com/nvim-telescope/telescope.nvim/issues/3436
--
-- This affects any plugin that uses telescope:
-- telescope.nvim, neogit, dressing.nvim
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()
    vim.opt_local.winborder = "none"
    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,
      callback = function()
        vim.opt_local.winborder = "rounded"
      end,
    })
  end,
})

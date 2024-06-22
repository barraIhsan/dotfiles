-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set leader key
vim.g.mapleader = " "

-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- set word wrap while still preserve indentation
vim.opt.wrap = true
vim.opt.breakindent = true

-- number
vim.opt.number = true

-- title
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- highlight search
vim.opt.hlsearch = true

-- no backup
vim.opt.backup = false

-- show last command
vim.opt.showcmd = true

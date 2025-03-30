local opt = vim.opt
local g = vim.g

-- turn on relative line number
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- enable line wrap
opt.wrap = true
opt.breakindent = true

-- save undo history
opt.undofile = true

-- bordered floating window
opt.winborder = "rounded"

-- disable built-in status line
opt.showmode = false

-- show where is our cursor currently in
opt.cursorline = true

-- disable ~ on eob
opt.fillchars = "eob: "

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- enable 24-bit colors
opt.termguicolors = true

-- sign column
opt.signcolumn = "yes"

-- enable backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- minimal lines to keep above and below the cursor.
opt.scrolloff = 5

-- fold (ufo)
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- disable default markdown "recommended" style (tab -> 4 space)
g.markdown_recommended_style = 0

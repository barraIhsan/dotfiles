local opt = vim.opt

-- turn on relative line number
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- enable line wrap
opt.wrap = true
opt.breakindent = true

-- save undo history
opt.undofile = true

-- disable built-in status line
opt.showmode = false

-- show where is our cursor currently in
opt.cursorline = true

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
opt.scrolloff = 10

-- fold (ufo)
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

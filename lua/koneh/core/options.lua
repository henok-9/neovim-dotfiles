local opt = vim.opt  -- vim global variable 

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation 
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
-- line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true  -- disable line and signcloumn to remove cursor line
-- appearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- bacspace
opt.backspace = "indent,eol,start"

-- clipboard !!very based!! uses system clipboard for cv/paste
opt.clipboard:append("unnamedplus")

-- split windows 
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")



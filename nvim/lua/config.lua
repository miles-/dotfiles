-- general settings
vim.wo.number = true -- make line numbers default
vim.wo.relativenumber = true -- relativen line numbers
vim.wo.cursorline = true -- highlight current line
vim.o.hlsearch = true -- set highlight on search
vim.o.incsearch = true
vim.o.ignorecase = true -- case insensitive searching unless /c or capital in search
vim.o.smartcase = true -- case insensitive searching unless /c or capital in search
vim.o.mouse = 'a' -- enable mouse mode
vim.o.breakindent = true -- enable break indent
-- vim.opt.undofile = true -- save undo history
vim.o.updatetime = 25 -- decrease update time0
vim.wo.signcolumn = 'yes'
--vim.opt.tabstop = 2
--vim.opt.shiftwidth = 2

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

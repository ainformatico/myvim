vim.cmd([[
  highlight FloatBorder ctermfg=Red
  highlight link NormalFloat DiagnosticFloatingError

  autocmd BufWinEnter * match ErrorMsg /[ ]\{1,}$/
  autocmd WinEnter * match ErrorMsg /[ ]\{1,}$/
]])

vim.cmd('set notermguicolors')
vim.cmd('colorscheme solarized')
vim.opt.background = "light"

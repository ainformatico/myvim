-- Spell checker in commit messages
vim.cmd([[
  autocmd BufWinEnter COMMIT_EDITMSG setl spell
  autocmd BufWinEnter *.md,*.mdx setl spell
]])
--
-- Show tabs as spaces for go files
vim.cmd([[
  autocmd Filetype go set listchars=tab:\ \ ,eol:¬
]])

vim.cmd([[
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
]])

vim.cmd([[
  autocmd BufWinEnter *.md,*.mdx silent! set ft=markdown
]])

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

vim.cmd([[
  augroup QuickFix
    au FileType qf nmap <buffer> <C-h> :cfdo %s/<C-r>"//g<left><left><left>
  augroup END
]])

-- Check for file changes when focus is gained
vim.cmd([[
  autocmd FocusGained,BufEnter * checktime
]])

-- Notify when the file has changed
vim.cmd([[
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

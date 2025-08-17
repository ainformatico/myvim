vim.g.mapleader = " "

vim.keymap.set("n", "]p", "p=`]")
vim.keymap.set("n", "]P", "P=`]")

-- Copy path of file to clipboard
vim.keymap.set("n", "<F8>", ":let @+=expand('%')<CR>")

-- Lint json
vim.keymap.set("n", "<LEADER>js", ":.!python3 -m json.tool<CR>")
-- yank to OS
vim.keymap.set("n", "<F9>", "\"+y")
-- paste from OS
vim.keymap.set("n", "<F10>", "\"+gP")
-- comment
vim.keymap.set("n", "<C-c>", "<leader>c<space>")
-- close current tab
vim.keymap.set("n", "<C-p>", ":tabclose<CR>`.")
-- edit
vim.keymap.set("n", "<C-h>", "cit")
-- this way we can simulate a real backspace, useful for plugins
vim.keymap.set("i", "<C-h>", "<BS>")
-- delete key, useful with <c-h> in insert mode
vim.keymap.set("i", "<C-l>", "<DEL>")
vim.keymap.set("n", "<C-s>", "<ESC>:w<CR>")
-- search and replace selected text
vim.keymap.set("v", "<C-h>", "\"hy:%s/<C-r>h//gc<left><left><left>")
-- sort, select lines and sort
vim.keymap.set("v", "<C-s>", ":sort<CR>")
-- hide search matches
vim.keymap.set("n", "\\", ":nohl<CR>")
-- search and replace in selected area
vim.keymap.set("v", "<C-g>", ":s/\\%V//gc<left><left><left><left>")
-- search in selected area
vim.keymap.set("v", "//", ":/\\%V")
-- line precision
vim.keymap.set("n", "`", "'")
-- go to last position, column precision
vim.keymap.set("n", "''", "`.")

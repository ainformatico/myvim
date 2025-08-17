local hop = require('hop')

hop.setup({})

vim.keymap.set("n", "<LEADER>w", vim.cmd.HopWordMW, {})
vim.keymap.set("n", "<LEADER>e", vim.cmd.HopChar1, {})
vim.keymap.set("n", "<LEADER>a", vim.cmd.HopAnywhereMW, {})
-- vim.keymap.set("n", "<LEADER><LEADER>w", vim.cmd.HopWordAC, {})
vim.keymap.set("n", "<LEADER><LEADER>b", vim.cmd.HopWordBC, {})

local hop = require('hop')

hop.setup({})

vim.keymap.set("n", ",,w", vim.cmd.HopWordAC, {})
vim.keymap.set("n", ",,b", vim.cmd.HopWordBC, {})

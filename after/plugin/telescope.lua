local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>o', function() builtin.live_grep({ grep_open_files = true }) end, {})
vim.keymap.set('v', '<leader>g', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>t', builtin.help_tags, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-s>"] = actions.select_horizontal,
      },
    },
  }
})

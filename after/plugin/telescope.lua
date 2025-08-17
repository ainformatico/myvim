local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('v', '<leader>g', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>t', builtin.help_tags, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})
vim.keymap.set('n', '<leader>c', builtin.commands, {})
vim.keymap.set('n', '<leader>v', builtin.command_history, {})
-- vim.keymap.set('n', '<leader>v', builtin.vim_options, {})
-- vim.keymap.set('n', '<leader>h', builtin.command_history, {})

require('telescope').setup({
  pickers = {
    buffers = {
      sort_mru = true
    }
  },
  defaults = {
    path_display = { 'truncate' },
    layout_config = {
      horizontal = { width = 0.95, preview_width = 0.5 },
    },
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-s>"] = actions.select_horizontal,
        ["<up>"] = actions.cycle_history_prev,
        ["<down>"] = actions.cycle_history_next,
      },
    },
  }
})

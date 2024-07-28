-- Copied from https://github.com/neovim/neovim/pull/28176/files#diff-49225a49c226c2f1b36f966d0178c556e204cdc0b660c80db9e4568e03f6ef99R117

local operator_rhs = function()
  return require('vim._comment').operator()
end

vim.keymap.set({ 'n', 'x' }, '<C-c>', operator_rhs, { expr = true, desc = 'Toggle comment' })

local line_rhs = function()
  return require('vim._comment').operator() .. '_'
end

vim.keymap.set('n', '<C-c>', line_rhs, { expr = true, desc = 'Toggle comment line' })

local textobject_rhs = function()
  require('vim._comment').textobject()
end

vim.keymap.set({ 'o' }, '<C-c>', textobject_rhs, { desc = 'Comment textobject' })

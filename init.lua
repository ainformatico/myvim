-- Autopairs
require("nvim-autopairs").setup {}

-- Telescope
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

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

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('v', '<leader>g', builtin.grep_string, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>t', builtin.help_tags, {})

-- Hop
local hop = require('hop')
hop.setup({
  direction = nil,
  current_line_only = false,
  case_insensitive = false,
  multi_windows = true
})

vim.keymap.set('n', ',,w', function()
  hop.hint_words({})
end, {remap=true})

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '/' },
    untracked    = { text = '?' },
  },
}

-- Sitter
local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "ruby", "bash", "typescript", "elixir", "gitignore", "json", "lua", "python", "regex", "rust", "go", "scss", "vim", "terraform" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    use_languagetree = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

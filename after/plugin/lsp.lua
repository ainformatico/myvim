vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition({ reuse_win = true }) end, opts)
    vim.keymap.set("n", "<C-w>gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<C-w><C-v>", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR> | <C-w>L", opts)
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
    vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<C-j>', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<C-k>', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>do', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
      vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
  end,
})

vim.lsp.config('gdscript', {})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      hint = { enable = true },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

vim.lsp.config('ruby_lsp', {
  single_file_support = false,

  -- make sure to use the `ruby-lsp` shim from `asdf`
  cmd = { os.getenv("HOME") .. "/.asdf/shims/ruby-lsp" },
})

vim.lsp.config('eslint', {
  codeActionOnSave = {
    enable = true,
    mode = "all"
  },
  workingDirectory = {
    mode = "auto"
  }
})

vim.lsp.config('tailwindcss', {
  filetypes = { "typescriptreact", "html", "elixir", "eelixir", "heex", "astro" },
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})

vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        extraPaths = { vim.fn.getcwd() .. "/src" }, -- or a custom absolute path
      },
    },
  }
})

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'eslint', 'lua_ls', 'ruby_lsp', 'rubocop', 'gopls' },
})

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' }
  }, {
    { name = 'buffer' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  }
})


local util = require("conform.util")

-- Only ever try and run prettier if we find a config for it
require("conform").formatters.prettier = vim.tbl_deep_extend("force", require("conform.formatters.prettier"), {
  cwd = util.root_file({ ".prettierrc" }),
  require_cwd = true,
})

require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "ruff_fix", "ruff_format" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    sql = { "sqlfluff" },
  },
})

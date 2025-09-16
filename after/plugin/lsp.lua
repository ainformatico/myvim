local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr, exclude = { 'K' } })

  -- lsp_zero.buffer_autoformat()

  local opts = { buffer = bufnr }

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
end)

require 'lspconfig'.gdscript.setup {}

local lspconfig = require("lspconfig")

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'eslint', 'lua_ls', 'ruby_lsp', 'rubocop', 'gopls' },
  handlers = {
    -- lsp_zero.default_setup,
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      lua_opts.settings.Lua.hint = { enable = true }

      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    -- this is the "custom handler" for `ruby_lsp`
    ruby_lsp = function()
      require('lspconfig').ruby_lsp.setup({
        single_file_support = false,

        -- make sure to use the `ruby-lsp` shim from `asdf`
        cmd = { os.getenv("HOME") .. "/.asdf/shims/ruby-lsp" },
      })
    end,
    eslint = function()
      require('lspconfig').eslint.setup({
        codeActionOnSave = {
          enable = true,
          mode = "all"
        },
        workingDirectory = {
          mode = "auto"
        }
      })
    end,
    tailwindcss = function()
      require('lspconfig').tailwindcss.setup({
        filetypes = { "typescriptreact", "html", "elixir", "eelixir", "heex", "astro" },
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      })
    end
  }
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({ details = true })

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' }
  },

  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
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
    python = { "ruff" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    sql = { "sqlfluff" },
  },
})

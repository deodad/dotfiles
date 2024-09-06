local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end)

lsp_zero.format_mapping('gq', {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    eslint = function ()
      require('lspconfig').eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,

    tsserver = function()
      require('lspconfig').tsserver.setup({
        init_options = {
           preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end,
      })
    end,
  }
})

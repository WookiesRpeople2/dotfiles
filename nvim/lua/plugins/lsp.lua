return {

  {

    'williamboman/mason.nvim',

    build = ":MasonUpdate",

    config = function()

      require("mason").setup({

        ui = {

          border = "rounded",

          icons = {

            package_installed = "✓",

            package_pending = "➜",

            package_uninstalled = "✗"

          }

        },

        max_concurrent_installers = 4,

      })

    end

  },



  {

    'williamboman/mason-lspconfig.nvim',

    dependencies = {

      'williamboman/mason.nvim',

      'neovim/nvim-lspconfig',

    },

    config = function()

      require("mason-lspconfig").setup({

        ensure_installed = {

          "omnisharp",

          "clangd",

          "lua_ls",

          "typescript-language-server",

        },

        automatic_installation = true,

      })

    end

  },



  {

    'neovim/nvim-lspconfig',

    dependencies = {

      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-buffer',

      'hrsh7th/cmp-path',

      'hrsh7th/nvim-cmp',

      'L3MON4D3/LuaSnip',

      'saadparwaiz1/cmp_luasnip',

    },

    config = function()

      local lspconfig = require('lspconfig')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()



      -- Global mappings.

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)

      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)



      -- Use an on_attach function to only map the following keys

      -- after the language server attaches to the current buffer

      local on_attach = function(client, bufnr)

        local bufopts = { noremap=true, silent=true, buffer=bufnr }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)

        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

        vim.keymap.set('n', '<space>wl', function()

          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))

        end, bufopts)

        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)

        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

      end



      -- Set up completion

      local cmp = require('cmp')

      local luasnip = require('luasnip')



      cmp.setup({

        snippet = {

          expand = function(args)

            luasnip.lsp_expand(args.body)

          end,

        },

        mapping = cmp.mapping.preset.insert({

          ['<C-b>'] = cmp.mapping.scroll_docs(-4),

          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          ['<C-Space>'] = cmp.mapping.complete(),

          ['<C-e>'] = cmp.mapping.abort(),

          ['<CR>'] = cmp.mapping.confirm({ select = true }),

        }),

        sources = cmp.config.sources({

          { name = 'nvim_lsp' },

          { name = 'luasnip' },

        }, {

          { name = 'buffer' },

        })

      })



      -- Set up lspconfig.

      local lsp_flags = {

        debounce_text_changes = 150,

      }



      -- Setup language servers

      lspconfig.lua_ls.setup({

        capabilities = capabilities,

        on_attach = on_attach,

        flags = lsp_flags,

      })



      lspconfig.clangd.setup({

        capabilities = capabilities,

        on_attach = on_attach,

        flags = lsp_flags,

      })



      lspconfig.omnisharp.setup({

        capabilities = capabilities,

        on_attach = on_attach,

        flags = lsp_flags,

      })



      -- TypeScript setup (using typescript-language-server)

      lspconfig.tsserver.setup({

        capabilities = capabilities,

        on_attach = on_attach,

        flags = lsp_flags,

        cmd = { "typescript-language-server", "--stdio" },

        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },

      })

    end

  }

}

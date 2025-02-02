return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls","clangd","pyright" },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
    end
  }

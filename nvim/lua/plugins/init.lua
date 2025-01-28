return {

  -- Plugin Manager

  { 'folke/lazy.nvim' },



  -- Theme

  {

    'catppuccin/nvim',

    name = 'catppuccin',

    priority = 1000,

    config = function()

      vim.cmd.colorscheme 'catppuccin-mocha'

    end

  },



  -- Icons

  { 'nvim-tree/nvim-web-devicons' },



  -- Which Key

  {

    'folke/which-key.nvim',

    config = function()

      require("which-key").setup({

        window = {

          border = "single",

          position = "bottom"

        }

      })

    end

  },



  -- Import other plugin configs

  { import = 'plugins.telescope' },

  { import = 'plugins.tree' },

  { import = 'plugins.terminal' },

  { import = 'plugins.treesitter' },

  { import = 'plugins.lsp' },

  { import = 'plugins.split' },

}

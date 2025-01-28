return {

  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate',

  config = function()

    require('nvim-treesitter.configs').setup({

      ensure_installed = {

        "c",

        "cpp",

        "c_sharp",

        "typescript",

        "tsx",

        "lua",

        "vim",

        "vimdoc",

        "query",

        "make"

      },

      sync_install = false,

      auto_install = true,

      highlight = {

        enable = true,

        additional_vim_regex_highlighting = false,

      },

      indent = {

        enable = true

      },

      incremental_selection = {

        enable = true,

        keymaps = {

          init_selection = "<CR>",

          node_incremental = "<CR>",

          node_decremental = "<BS>",

          scope_incremental = "<TAB>",

        },

      },

    })

  end

}

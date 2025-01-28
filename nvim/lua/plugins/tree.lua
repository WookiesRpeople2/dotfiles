return {

  'nvim-tree/nvim-tree.lua',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()

    require("nvim-tree").setup({

      view = { width = 30 },

      renderer = {

        icons = {

          glyphs = {

            default = "",

            symlink = "",

            git = {

              unstaged = "✗",

              staged = "✓",

              unmerged = "",

              renamed = "➜",

              untracked = "★",

              deleted = "",

              ignored = "◌"

            },

          }

        }

      }

    })

    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

  end

}

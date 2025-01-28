return {

  'nvim-telescope/telescope.nvim',

  dependencies = {

    'nvim-lua/plenary.nvim',

    'nvim-telescope/telescope-fzf-native.nvim'

  },

  config = function()

    local telescope = require('telescope')

    telescope.setup({

      defaults = {

        prompt_prefix = "🔍 ",

        selection_caret = "➤ ",

        layout_config = {

          horizontal = { width = 0.9 }

        }

      }

    })



    -- Keymaps

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

  end

}

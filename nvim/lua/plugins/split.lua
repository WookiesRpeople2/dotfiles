return {

   -- Tab and statusLine
   {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",

          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      })
    end
  },

  -- Better window management
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup({
        ignored_filetypes = {

          'nofile',
          'quickfix',
          'prompt',
        },
      })
    end

  },

}

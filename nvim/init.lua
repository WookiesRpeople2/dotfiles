-- Set leader key early

vim.g.mapleader = ' '

vim.g.maplocalleader = ' '



-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then

  vim.fn.system({

    "git",

    "clone",

    "--filter=blob:none",

    "https://github.com/folke/lazy.nvim.git",

    "--branch=stable",

    lazypath,

  })

end

vim.opt.rtp:prepend(lazypath)



-- Load all configurations

require('config.options')

require('config.keymaps')

require('config.autocmds')



-- Initialize lazy with plugins

require("lazy").setup("plugins", {

  change_detection = {

    notify = false,

  },

  checker = {

    enabled = true,

    notify = false,

  },

  performance = {

    rtp = {

      disabled_plugins = {

        "gzip",

        "matchit",

        "matchparen",

        "netrwPlugin",

        "tarPlugin",

        "tohtml",

        "tutor",

        "zipPlugin",

      },

    },

  },

})

-- lua/plugins/terminal.lua
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal


    -- Store terminal instances
    local terminals = {}


    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = function()

          return math.floor(vim.o.columns * 0.8)
        end,

        height = function()
          return math.floor(vim.o.lines * 0.8)
        end
      },
      -- Configure multiple terminals

      size = function(term)
        if term.direction == "horizontal" then

          return 15

        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      -- Add terminal mode mappings
      on_open = function(term)
        vim.cmd("startinsert!")
        -- Terminal mode mappings

        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', [[<C-\><C-n>]], {noremap = true, silent = true})

        vim.api.nvim_buf_set_keymap(term.bufnr, 't', 'jk', [[<C-\><C-n>]], {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-h>', [[<C-\><C-n><C-W>h]], {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-j>', [[<C-\><C-n><C-W>j]], {noremap = true, silent = true})

        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-k>', [[<C-\><C-n><C-W>k]], {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-l>', [[<C-\><C-n><C-W>l]], {noremap = true, silent = true})
      end,
      -- Make sure terminal starts in insert mode
      start_in_insert = true,
      -- Terminal specific settings
      shell = vim.o.shell,
      auto_scroll = true,

      persist_mode = true,
      close_on_exit = true,
      -- Disable these to prevent terminal multiplexing
      insert_mappings = false,
      terminal_mappings = false,
      shade_terminals = true
    })

    -- Create specific terminals
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      count = 1,
    })


    local htop = Terminal:new({
      cmd = "htop",
      hidden = true,
      direction = "float",
      count = 2,
    })

    -- Function to get or create a numbered terminal
    local function get_or_create_terminal(num, direction)
      local key = string.format("%s_%d", direction, num)
      if not terminals[key] then
        terminals[key] = Terminal:new({

          hidden = true,
          direction = direction,
          count = num + 10,
        })
      end
      return terminals[key]
    end

    -- Terminal toggle functions
    local function _lazygit_toggle()
      lazygit:toggle()
    end


    local function _htop_toggle()
      htop:toggle()
    end

    local function _terminal_toggle(num, direction)

      local term = get_or_create_terminal(num, direction)
      term:toggle()
    end

    -- Terminal mappings
    vim.keymap.set('n', '<leader>lg', _lazygit_toggle, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>ht', _htop_toggle, {noremap = true, silent = true})

    -- Numbered terminals in different layouts
    vim.keymap.set('n', '<leader>t1', function() _terminal_toggle(1, "horizontal") end, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>t2', function() _terminal_toggle(2, "vertical") end, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>t3', function() _terminal_toggle(3, "float") end, {noremap = true, silent = true})
  end
}

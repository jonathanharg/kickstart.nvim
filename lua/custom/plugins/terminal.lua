return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      local toggleterm = require 'toggleterm'
      local Terminal = require('toggleterm.terminal').Terminal

      toggleterm.setup {}

      vim.keymap.set('n', '<leader>tj', function()
        toggleterm.toggle(1)
      end, { desc = '[T]erminal toggle 1' })
      vim.keymap.set('n', '<leader>tk', function()
        toggleterm.toggle(2)
      end, { desc = '[T]erminal toggle 2' })
      vim.keymap.set('n', '<leader>tl', function()
        toggleterm.toggle(3)
      end, { desc = '[T]erminal toggle 3' })
      -- vim.keymap.set('n', '<leader>t;', function()
      --   toggleterm.toggle(4)
      -- end, { desc = '[T]erminal toggle 4' })

      vim.keymap.set('n', '<leader>ta', function()
        toggleterm.toggle_all()
      end, { desc = '[T]erminal toggle [A]ll' })

      local lazygit = Terminal:new {
        cmd = 'lazygit',
        hidden = true,
        direction = 'float',
      }

      vim.keymap.set('n', '<leader>gl', function()
        lazygit:toggle()
      end, { desc = '[G]it [L]azy' })
    end,
  },
}

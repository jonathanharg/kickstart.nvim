return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    opts = {
      graph_style = 'unicode',
    },
    keys = {
      { '<leader>gs', ':Neogit kind=auto<cr>', desc = '[G]it [S]tatus' },
      { '<leader>gc', ':Neogit commit<cr>', desc = '[G]it [C]ommit' },
    },
  },
}

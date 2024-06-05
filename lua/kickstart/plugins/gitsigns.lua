-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[g]it [h]unk [s]tage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[g]it [h]unk [r]eset' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[g]it [S]tage buffer' })
        map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = '[g]it [h]unk [u]ndo stage' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[g]it [R]eset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[g]it [h]unk [p]review' })
        map('n', '<leader>ghb', gitsigns.blame_line, { desc = '[g]it [h]unk [b]lame' })
        map('n', '<leader>ghd', gitsigns.diffthis, { desc = '[g]it [h]unk [d]iff against index' }) -- Does this actually apply to a hunk?
        map('n', '<leader>ghD', function()
          gitsigns.diffthis '@'
        end, { desc = '[g]it [h]unk [D]iff against last commit' }) -- Does this also count as a hunk?
        -- Toggles
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[g]it [b]lame toggle' })
        map('n', '<leader>gd', gitsigns.toggle_deleted, { desc = '[g]it [D]eleted toggle' })
      end,
    },
  },
}

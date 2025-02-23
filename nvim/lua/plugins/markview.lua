return {
  { --
    'OXY2DEV/markview.nvim',
    lazy = false,
    init = function()
      require('markview').setup {
        preview = {
          modes = { 'n', 'no', 'c' }, -- Change these mode to what you need
          hybrid_modes = { 'n' }, -- Uses this feature on normal mode
          -- This is nice to have
          callbacks = {
            on_enable = function(_, win)
              vim.wo[win].conceallevel = 2
              vim.wo[win].concealcursor = 'c'
            end,
          },
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

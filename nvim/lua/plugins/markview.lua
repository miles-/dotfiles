return {
  { --
    'OXY2DEV/markview.nvim',
    lazy = false,
    init = function()
      -- markview's queries use `set-lang-from-info-string!`, which the rewritten
      -- nvim-treesitter (main branch) no longer registers. Define it here.
      vim.treesitter.query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
        local node = match[pred[2]]
        if type(node) == 'table' then
          node = node[1]
        end
        if not node then
          return
        end
        local alias = vim.treesitter.get_node_text(node, bufnr):lower()
        local lang = vim.filetype.match { filename = 'a.' .. alias } or alias
        metadata['injection.language'] = lang
      end, { force = true, all = true })

      require('markview').setup {
        experimental = {
          check_rtp_message = false, -- Hide the warning message
        },
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

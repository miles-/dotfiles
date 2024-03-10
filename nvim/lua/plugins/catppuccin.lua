return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
      require('catppuccin').setup {
        term_colors = true,
        integrations = {
          cmp = true,
          fidget = true,
          gitsigns = true,
          indent_blankline = { enabled = true },
          mason = true,
          native_lsp = { enabled = true },
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

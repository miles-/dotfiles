require("catppuccin").setup({
  term_colors = true,
  dim_inactive = {
    enabled = false,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
    },
    native_lsp = {
      enabled = true,
    },
  },
})

-- set statusbar
vim.g.lightline = {
  colorscheme = 'catppuccin',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

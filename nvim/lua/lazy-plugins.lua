-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
require('lazy').setup {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
  'tpope/vim-fugitive', -- Git commands in neovim
  'tpope/vim-rhubarb', -- Fugitive-companion to interact with GitHub

  -- modular approach: using `require path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'plugins/gitsigns',
  require 'plugins/which-key',
  require 'plugins/telescope',
  require 'plugins/lspconfig',
  require 'plugins/conform',
  require 'plugins/cmp',
  require 'plugins/catppuccin',
  require 'plugins/todo-comments',
  require 'plugins/mini',
  require 'plugins/treesitter',
}

-- vim: ts=2 sts=2 sw=2 et

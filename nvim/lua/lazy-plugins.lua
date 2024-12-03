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
  'tpope/vim-fugitive', -- Git commands in neovim
  'tpope/vim-rhubarb', -- Fugitive-companion to interact with GitHub

  -- modular approach: using `require path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'plugins/catppuccin',
  require 'plugins/cmp',
  require 'plugins/conform',
  require 'plugins/copilot',
  require 'plugins/gitsigns',
  require 'plugins/helm',
  require 'plugins/lspconfig',
  require 'plugins/markdown-preview',
  require 'plugins/mini',
  require 'plugins/neo-tree',
  require 'plugins/telescope',
  require 'plugins/todo-comments',
  require 'plugins/treesitter',
  require 'plugins/which-key',
  require 'plugins/markview',
}

-- vim: ts=2 sts=2 sw=2 et

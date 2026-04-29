return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install {
        'bash',
        'c',
        'diff',
        'hcl',
        'html',
        'latex',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'terraform',
        'vim',
        'vimdoc',
      }

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype
          local lang = vim.treesitter.language.get_lang(ft)
          if lang and pcall(vim.treesitter.start, buf, lang) then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

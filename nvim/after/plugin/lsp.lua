local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'cssls',
  'dockerls',
  'gopls',
  'jsonls',
  'pylsp',
  'rust_analyzer',
  'solargraph',
  'sqls',
  'sumneko_lua',
  'tailwindcss',
  'terraformls',
  'tflint',
  'tsserver',
})

local cmp = require 'cmp'
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(),
  ['<C-n>'] = cmp.mapping.select_next_item(),
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  ['<Tab>'] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end,
  ['<S-Tab>'] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", 'gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", 'gi', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
  vim.keymap.set("n", '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  vim.keymap.set("n", '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set("n", '<space>D', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", '<space>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", '<space>ca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", '<space>f', function() vim.lsp.buf.formatting() end, opts)
  vim.keymap.set("n", '<space>e', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", ']d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", '<space>q', function() vim.diagnostic.setloclist() end, opts)
end)

lsp.setup()

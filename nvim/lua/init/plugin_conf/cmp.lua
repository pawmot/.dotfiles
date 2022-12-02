cmp = {}

function cmp.register(packer_use)
  packer_use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind-nvim'
    },
    config = function()
      local sources = {
        buffer = '[Buf]',
        nvim_lsp = '[LSP]',
        path = '[Path]'
      }
      --local kind = require('lspkind')

      local c = require('cmp')
      c.setup({
        mapping = c.mapping.preset.insert({
          ['<C-y>'] = c.mapping.confirm({ select = true }),
          ['<C-u>'] = c.mapping.scroll_docs(-4),
          ['<C-d>'] = c.mapping.scroll_docs(4),
          ['<C-Space>'] = c.mapping.complete(),
        }),
      
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' }
        }
      })
    end
  }
end

return cmp

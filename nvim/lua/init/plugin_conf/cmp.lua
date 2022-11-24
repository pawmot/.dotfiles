local cmp = {}

function cmp.register(packer_use)
  packer_use("hrsh7th/cmp-nvim-lsp")
  packer_use("hrsh7th/cmp-buffer")
  packer_use("hrsh7th/cmp-path")
  packer_use("hrsh7th/cmp-cmdline")
  packer_use("hrsh7th/nvim-cmp")
  --packer_use("onsails/lspkind-nvim")

  local c = require("cmp")
  local sources = {
    buffer = "[Buf]",
    nvim_lsp = "[LSP]",
    path = "[Path]"
  }
  --local kind = require("lspkind")

  c.setup({
 	  mapping = c.mapping.preset.insert({
      ['<C-y>'] = c.mapping.confirm({ select = true }),
      ["<C-u>"] = c.mapping.scroll_docs(-4),
      ["<C-d>"] = c.mapping.scroll_docs(4),
      ["<C-Space>"] = c.mapping.complete(),
    }),
  
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
      { name = "cmdline" }
    }
  })

end

return cmp

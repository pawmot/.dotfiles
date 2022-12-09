local M = {}

function M.register(packer_use)
  packer_use {
    'saecki/crates.nvim',
    event = { 'Bufread Cargo.toml' },
    config = function()
      require('crates').setup {
        src = {
          coq = {
            enabled = true,
            name = "crates"
          }
        }
      }
    end
  }
end

return M

